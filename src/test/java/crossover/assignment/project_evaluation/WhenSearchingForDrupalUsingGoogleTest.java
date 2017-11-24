package crossover.assignment.project_evaluation;

import static org.junit.Assert.assertEquals;
import static junit.framework.Assert.assertTrue;

import java.io.File;
import java.io.IOException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class WhenSearchingForDrupalUsingGoogleTest {
  private String baseUrl;
  private WebDriver driver;
  
  @Before
  public void openBrowser() {
    baseUrl = System.getProperty("webdriver.base.url");
    driver = new FirefoxDriver();
    driver.get(baseUrl);
  }
  
  @After
  public void saveScreenshotAndCloseBrowser() throws IOException {
    driver.quit();
  }
  
  @Test
  public void pageTitleAfterSearchShouldBeginWithDrupal() throws IOException {
//    assertEquals("The page title should equal Google at the start of the test.", "Crossover", driver.getTitle());
    /*WebElement searchField = driver.findElement(By.name("q"));
    searchField.sendKeys("Drupal!");
    searchField.submit();*/
    
  }
  
  
  }
