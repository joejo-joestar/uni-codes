import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class GUIJb implements ActionListener {

    static JFrame f;
    static JTextField t;
    String o1, o2, op;

    public GUIJb() {
        o1 = o2 = op = "";
    }

    public static void main(String[] args) {

        GUIJb c = new GUIJb();
        t = new JTextField(16);
        f = new JFrame("Clalulater");
        t.setEditable(false);
        JButton[] b = new JButton[10];

        JButton be = new JButton("="), bs = new JButton("-"), ba = new JButton("+"), bm = new JButton("*"),
                bd = new JButton("/"), bc = new JButton("C"), bp = new JButton(".");
        JPanel p = new JPanel();

        for (int i = 0; i < b.length; i++) {
            b[i] = new JButton(Integer.toString(i));
            b[i].addActionListener(c);
        }

        be.addActionListener(c);
        ba.addActionListener(c);
        bs.addActionListener(c);
        bm.addActionListener(c);
        bd.addActionListener(c);
        bc.addActionListener(c);
        bp.addActionListener(c);

        p.add(t);
        p.add(ba);
        p.add(b[1]);
        p.add(b[2]);
        p.add(b[3]);
        p.add(bs);
        p.add(b[4]);
        p.add(b[5]);
        p.add(b[6]);
        p.add(bm);
        p.add(b[7]);
        p.add(b[8]);
        p.add(b[9]);
        p.add(bd);
        p.add(b[0]);
        p.add(be);
        p.add(bc);
        p.add(bp);
        p.setLayout(new FlowLayout());
        p.setBackground(new Color(40, 40, 40));
        f.add(p);
        f.setSize(200, 220);
        f.setVisible(true);

        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    }

    public void actionPerformed(ActionEvent e) {
        String s = e.getActionCommand();

        if ((s.charAt(0) >= '0' && s.charAt(0) <= '9') || s.charAt(0) == '.') {
            if (!op.equals("")) {
                o2 = o2 + s;
            } else {
                o1 = o1 + s;
            }
            t.setText(o1 + op + o2);
        } else if (s.charAt(0) == 'C') {
            o1 = o2 = op = "";
            t.setText(o1 + op + o2);
        } else if (s.charAt(0) == '=') {
            double to;
            if (op.equals("+")) {
                to = (Double.parseDouble(o1) + Double.parseDouble(o2));
            } else if (op.equals("-")) {
                to = (Double.parseDouble(o1) - Double.parseDouble(o2));
            } else if (op.equals("*")) {
                to = (Double.parseDouble(o1) * Double.parseDouble(o2));
            } else {
                to = (Double.parseDouble(o1) / Double.parseDouble(o2));
            }

            t.setText(o1 + op + o2 + "=" + to);
            o1 = Double.toString(to);
            op = o2 = "";
        } else {
            if (op.equals("") || o2.equals(""))
                op = s;
            else {
                double to;
                if (op.equals("+")) {
                    to = (Double.parseDouble(o1) + Double.parseDouble(o2));
                } else if (op.equals("-")) {
                    to = (Double.parseDouble(o1) - Double.parseDouble(o2));
                } else if (op.equals("*")) {
                    to = (Double.parseDouble(o1) * Double.parseDouble(o2));
                } else {
                    to = (Double.parseDouble(o1) / Double.parseDouble(o2));
                }
                o1 = Double.toString(to);
                op = s;
                o2 = "";
            }
            t.setText(o1 + op + o2);
        }
    }

}
