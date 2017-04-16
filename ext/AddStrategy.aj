package ext;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JPanel;

import battleship.BattleshipDialog;

public privileged aspect AddStrategy {
	private JButton playButton = new JButton("Play");
	

	
	JPanel around(BattleshipDialog dialog): target(dialog) && execution(JPanel makeControlPane()){
		JButton practice = (JButton)dialog.playButton;
		practice.setText("Practice");
		JPanel buttons = new JPanel(new FlowLayout(FlowLayout.LEFT));
		buttons.add(practice); 
		buttons.add(this.playButton);
		return buttons;
	}

	
}
