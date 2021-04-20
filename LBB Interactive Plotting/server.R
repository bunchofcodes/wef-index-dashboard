function(input, output){
  
  output$genderPlot <- renderPlotly({
    scoreongender <- student %>%
      select(gender, math.score, writing.score, reading.score) %>% 
      filter(gender %in% input$selectGender) %>%
      group_by(gender) %>% 
      summarise(
        Math = mean(math.score),
        Writing = mean(writing.score),
        Reading = mean(reading.score)) %>%  
      ungroup() %>% 
      pivot_longer(-gender) %>% 
      mutate(text = paste("Score:", round(value,2)))
    
    barplot2 <- ggplot(scoreongender, aes(fill=gender, y=name, x=value, text = text)) + 
      geom_bar(position="dodge", stat="identity") +
      labs(title = "Average Score based on Gender",
           x = "Score",
           y = "")
    
    ggplotly(barplot2, tooltip = "text") %>% 
      config(displayModeBar = F)
  })
  
  output$racePlot <- renderPlotly({
    scoreonrace <- student %>%
      select(race.ethnicity, math.score, writing.score, reading.score) %>% 
      filter(race.ethnicity %in% input$selectRace) %>%
      group_by(race.ethnicity) %>% 
      summarise(
        Math = mean(math.score),
        Writing = mean(writing.score),
        Reading = mean(reading.score)) %>%  
      ungroup() %>% 
      pivot_longer(-race.ethnicity) %>% 
      mutate(text = paste("Score:", round(value,2)))
    
    barplot1 <- ggplot(scoreonrace, aes(fill=name, y=race.ethnicity, x=value, text = text)) + 
      geom_bar(position="dodge", stat="identity") +
      labs(title = "Average Score based on Race",
           x = "Score",
           y = "")
    
    ggplotly(barplot1, tooltip = "text") %>% 
      config(displayModeBar = F)
  })
  
  output$leveleduPlot <- renderPlotly({
    scoreonedu <- student %>% 
      select(parental.level.of.education, lunch, total) %>%
      filter(parental.level.of.education %in% input$selectParentEdu,
             lunch %in% input$selectLunch)
    
    boxplot1 <- ggplot(scoreonedu, aes(x = parental.level.of.education, y = total, fill = lunch))+
      geom_boxplot()+
      scale_fill_viridis_d(alpha = 0.4) +
      geom_jitter(color="black", size=0.9, alpha=0.3) +
      theme(
        legend.position="none",
        plot.title = element_text(size=14)
      ) +
      ggtitle("Boxplot Lunch, Parent's Education and Total Score Comparison") +
      xlab("Parent's Level of Education") +
      ylab("Total Score")
    
    ggplotly(boxplot1)
  })

  output$testprepPlot <- renderPlotly({
    scoreoncourse <- student %>% 
      select(test.preparation.course, total)
    
    denplot1 <- ggplot(scoreoncourse, aes(x=total, color=test.preparation.course, fill=test.preparation.course)) +
      geom_density(alpha=0.6) +
      labs(title = "Density Plot based on Preparation Course",
           x = "Total Score",
           y = "")
    
    ggplotly(denplot1) %>% 
      config(displayModeBar = F)
  })
}