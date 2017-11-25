package crossover.assignment.project_evaluation;

import static org.junit.Assert.assertEquals;

import java.io.IOException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class CrossoverUnitTest {
  private String baseUrl;
  private WebDriver chrDriver;
  
  @Before
  public void openBrowsers() {
	try {
		baseUrl = System.getProperty("webdriver.base.url");
	} catch (Exception e) {
		baseUrl = new String("https://www.crossover.com");
	}
    chrDriver = new ChromeDriver();
    
  }
  
  @After
  public void saveScreenshotAndCloseBrowser() throws IOException {
    chrDriver.quit();
    
  }
  
  @Test
  public void homePageChrome() throws IOException {
	  chrDriver.get(baseUrl);
	  assertEquals("Crossover", chrDriver.getTitle());
  }
  
  
  
  }
