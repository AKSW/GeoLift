/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.aksw.geolift.nlp;

/**
 *
 * @author ngonga
 */
public class NerToolFactory {

    public static NerTool get(String name) {
        try {
            if (name.toLowerCase().startsWith("fox")) {
                return new Fox();
            }
            //default
        } catch (Exception e) {
        }
        return new Fox();
    }
}
