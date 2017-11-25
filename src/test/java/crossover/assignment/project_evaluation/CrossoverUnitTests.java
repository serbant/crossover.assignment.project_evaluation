package crossover.assignment.project_evaluation;

import static org.junit.Assert.assertEquals;

import java.io.IOException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

public class CrossoverUnitTests {
  private String baseUrl;
  private WebDriver chrDriver;
  private WebDriver ffDriver;
  
  @Before
  public void openBrowsers() {
	try {
		baseUrl = System.getProperty("webdriver.base.url");
	} catch (Exception e) {
		baseUrl="https://www.crossover.com";
	}
    chrDriver = new ChromeDriver();
    ffDriver=new FirefoxDriver();
    chrDriver.get(baseUrl);
    ffDriver.get(baseUrl);
  }
  
  @After
  public void saveScreenshotAndCloseBrowser() throws IOException {
    chrDriver.quit();
    ffDriver.quit();
  }
  
  @Test
  public void homePageChrome() throws IOException {
	  assertEquals("Crossover", chrDriver.getTitle());
  }
  
  /*@Test
  public void homePageFirefox() throws IOException {
	  assertEquals("Crossover", ffDriver.getTitle());
  }*/
  
  }