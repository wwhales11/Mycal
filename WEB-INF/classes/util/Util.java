package util;

import java.io.*;

public class Util {
	public static void saveImage(String base, String id, String filename, byte[] data) throws Exception {
		File f = new File(base);
		if (!f.exists()) f.mkdir();

		// make a directory for each user id if not exists
		String dir = base + "/" + id;
		f = new File(dir);
		if (!f.exists()) f.mkdir();

		// save data into the file with a given path and name
		FileOutputStream out = new FileOutputStream(new File(dir + "/" + filename));
		out.write(data);
		out.close();
	}
}
