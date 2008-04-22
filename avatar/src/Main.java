/* EasyWay Game Engine
 * Copyright (C) 2007 Daniele Paggi.
 *  
 * Written by: 2007 Daniele Paggi<dshnt@hotmail.com>
 *   
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Library General Public License for more details.
 * 
 * You should have received a copy of the GNU Library General Public
 * License along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */
import org.easyway.forms.Launcher;
import org.easyway.input.Keyboard;
import org.easyway.interfaces.extended.ILoopable;
import org.easyway.objects.SplittedCamera;
import org.easyway.objects.nativeGraphic.Rectangle;
import org.easyway.objects.sprites2D.Sprite;
import org.easyway.objects.text.FPSWriter;
import org.easyway.objects.text.Text;
import org.easyway.objects.texture.Texture;
import org.easyway.system.Core;

public class Main extends Core {

	private static final long serialVersionUID = -7767907866103200650L;

	static int screen_width, screen_height;

	static Texture commonImage;

	static int NUMBER_SPRITE_TO_ADD = 50;

	public Main(int width, int height, int bpp, boolean fullscreen) {
		super(width, height, bpp, fullscreen);
		screen_height = height;
		screen_width = width;
	}

	Texture redBall;

	Text space;

	SplittedCamera camera1, camera2;

	@Override public void creation() {
		new FPSWriter(null, 10, 10);
		commonImage = new Texture("images/nave.PNG", 255, 255, 255);
		for (int i = 0; i < 19; ++i)
			new Ball();
		new Text(10, 25, "Press Enter to enable\\disable split screen ", null);
		new Text(10, 50, "Press ESC to end the demo", null);
		space = new Text(10, 75, "Press Space to add other "
				+ NUMBER_SPRITE_TO_ADD + " sprites", null);

		// new TextureFBO(new Texture(1024,1024));
		camera1 = new SplittedCamera(getWidth(), getHeight() / 2);
		camera2 = new SplittedCamera(getWidth(), getHeight() / 2);
		camera1.getDrawingArea().setXY(0, 0);
		camera2.getDrawingArea().setXY(0, getHeight() / 2);
		camera2.centerOn(new Ball());
		Rectangle r = new Rectangle(10,50,100,200);
		r.setColor(0, 0, 0, 1, 0.4f);
		r.setColor(1, 0, 1, 0, 0.6f);
		r.setColor(2, 1, 0, 0, 0.4f);
		r.setColor(3, 1, 0, 1, 0.6f);
	}

	public void render() {
		// drawing loop..
		// usually not used :)
	}

	boolean isNormal = false;

	public void coreRender() {
		if (isNormal) {
			super.coreRender();
		} else {
			camera1.render();
			camera2.render();
		}
	}

	public void loop() {
		// data loop..
		if (Keyboard.isKeyPressed(Keyboard.KEY_ESCAPE)) {
			endGame();
		}
		if (Keyboard.isKeyPressed(Keyboard.KEY_RETURN)) {
			isNormal = !isNormal;
		}
		if (Keyboard.isKeyDown(Keyboard.KEY_SPACE) && space != null) {
			space.destroy();
			space = null;
			for (int i = 0; i < NUMBER_SPRITE_TO_ADD; ++i)
				new Ball();
		}
	}

	public static void main(String[] args) {
		new Launcher("Test Game", Main.class);
	}

	class Ball extends Sprite implements ILoopable {

		// ------------

		private static final long serialVersionUID = 6118032169056760712L;

		float speedx, speedy;

		// ------------

		public Ball() {
			super(commonImage);

			// random size
			setSize(getWidth() + (int) (random() * 5 + 5), getHeight()
					+ ((int) random() * 5 + 5));

			// random position
			setXY((float) Math.random() * (screen_width - getWidth()),
				(float) Math.random() * (screen_height - getHeight()));

			// random roteation
			anglez = (float) Math.random() * 360;

			// random saturation (color)
			colorRed = (float) Math.random() + 0.3f;
			colorGreen = (float) Math.random() + 0.3f;
			colorBlue = (float) Math.random() + 0.3f;

			// random alpha (transparent = 0, solid = 1)
			colorAlpha = (float) Math.random() / 2 + 0.5f;

			// random speed
			speedx = random();
			speedy = random();
		}

		public void loop() {
			// x < 0 or (x+width) > width_screen
			if (getX() <= 0 || getX() + getWidth() >= screen_width) {
				speedx = -speedx;
			}
			// y<0 or (y+height) > height_screen
			if (getY() <= 0 || getY() + getHeight() >= screen_height) {
				speedy = -speedy;
			}
			move(speedx, speedy);
		}

	}

	private float random() {
		return (float) Math.random() * 10 - 5;
	}

}
