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
import java.awt.Container;

import org.easyway.objects.sprites2D.Sprite;
import org.easyway.objects.texture.Texture;
import org.easyway.system.Core;

public class InternalWindow extends Core {

	private static final long serialVersionUID = -8087057106496841718L;

	public void creation() {
		Texture texture = new Texture("/images/red.bmp");
		new Sprite(100, 100, texture);
	}

	public void render() {

	}

	public void loop() {

	}

	public InternalWindow(Container c) {
		super(800, 600, 32, c);
	}

}
