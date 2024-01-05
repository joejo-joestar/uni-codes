import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class GUIJrb implements ActionListener {

    static JFrame f;
    static JTextField t;
    static JTextField n1;
    static JTextField n2;
    static JRadioButton rba, rbs, rbm, rbd;
    
    public static void main(String[] args) {
        
        GUIJrb c = new GUIJrb();
        t = new JTextField(16);
        n1 = new JTextField(16);
        n2 = new JTextField(16);
        f = new JFrame("Clalulater");
        t.setEditable(false);
        JButton be = new JButton("=");
        JPanel p = new JPanel();
        JLabel l1 = new JLabel("n1");
        JLabel l2 = new JLabel("n2");
        rba = new JRadioButton("+");
        rbs = new JRadioButton("-");
        rbm = new JRadioButton("*");
        rbd = new JRadioButton("/");
        ButtonGroup g = new ButtonGroup();
        g.add(rba);
        g.add(rbs);
        g.add(rbm);
        g.add(rbd);
        
        be.addActionListener(c);
        p.add(l1);
        p.add(n1);
        p.add(l2);
        p.add(n2);
        p.add(rba);
        p.add(rbs);
        p.add(rbm);
        p.add(rbd);
        p.add(be);
        p.add(t);
        p.setLayout(new FlowLayout());
        f.add(p);
        f.setSize(200, 220);
        f.setVisible(true);

        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    }

    public void actionPerformed(ActionEvent e) {
            double to;
            try{
            if (rba.isSelected()) {
                to = (Double.parseDouble(n1.getText()) + Double.parseDouble(n2.getText()));
            } else if (rbs.isSelected()) {
                to = (Double.parseDouble(n1.getText()) - Double.parseDouble(n2.getText()));
            } else if (rbm.isSelected()) {
                to = (Double.parseDouble(n1.getText()) * Double.parseDouble(n2.getText()));
            } else {
                to = (Double.parseDouble(n1.getText()) / Double.parseDouble(n2.getText()));
            } 
            t.setText(Double.toString(to));
        } catch (Exception ex) {t.setText("Invalid");}
    }
}
