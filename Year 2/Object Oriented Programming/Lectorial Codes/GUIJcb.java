import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class GUIJcb implements ActionListener {

    static JFrame f;
    static JTextField t;
    static JTextField n1;
    static JTextField n2;
    static String[] o = new String[] { "+", "-", "*", "/" };
    static JComboBox<String> cb = new JComboBox<>(o);

    public static void main(String[] args) {

        GUIJcb c = new GUIJcb();
        t = new JTextField(16);
        n1 = new JTextField(16);
        n2 = new JTextField(16);
        f = new JFrame("Clalulater");
        t.setEditable(false);
        JButton be = new JButton("=");
        JPanel p = new JPanel();

        be.addActionListener(c);
        p.add(n1);
        p.add(cb);
        p.add(n2);
        p.add(be);
        p.add(t);
        p.setLayout(new FlowLayout());
        p.setBackground(new Color(40, 40, 40));
        f.add(p);
        f.setSize(200, 220);
        f.setVisible(true);

        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        

    }

    public void actionPerformed(ActionEvent e) {
        double to;
        try {
            if (cb.getItemAt(cb.getSelectedIndex()).equals("+")) {
                to = (Double.parseDouble(n1.getText()) + Double.parseDouble(n2.getText()));
            } else if (cb.getItemAt(cb.getSelectedIndex()).equals("-")) {
                to = (Double.parseDouble(n1.getText()) - Double.parseDouble(n2.getText()));
            } else if (cb.getItemAt(cb.getSelectedIndex()).equals("*")) {
                to = (Double.parseDouble(n1.getText()) * Double.parseDouble(n2.getText()));
            } else {
                to = (Double.parseDouble(n1.getText()) / Double.parseDouble(n2.getText()));
            }
            t.setText(n1.getText() + cb.getItemAt(cb.getSelectedIndex()) + n2.getText() + " = " + to);
        } catch (Exception ex) {
            t.setText("Invalid");
        }
    }
}
