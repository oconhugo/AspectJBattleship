package ext;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JPanel;

import battleship.BattleshipDialog;

public privileged aspect AddStrategy {
	/* New play button */
	private JButton newPlayButton = new JButton("Play");

	//Gets the returning value of the method makeControlPane
	//Then adds the newPlayButton to the pane
	after(BattleshipDialog dialog) returning(JPanel content): target(dialog) && execution(JPanel makeControlPane()){
		JButton practice = dialog.playButton;
		practice.setText("Practice");
		JPanel buttons = new JPanel(new FlowLayout(FlowLayout.LEFT));
		buttons.add(practice); 
		buttons.add(this.newPlayButton);
	    content.add(buttons, BorderLayout.NORTH);
	}
}
