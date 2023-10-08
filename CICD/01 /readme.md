## Основная часть

Необходимо создать собственные workflow для двух типов задач: bug и остальные типы задач. Задачи типа bug должны проходить жизненный цикл:

1. Open -> On reproduce.
2. On reproduce -> Open, Done reproduce.
3. Done reproduce -> On fix.
4. On fix -> On reproduce, Done fix.
5. Done fix -> On test.
6. On test -> On fix, Done.
7. Done -> Closed, Open.

Остальные задачи должны проходить по упрощённому workflow:

1. Open -> On develop.
2. On develop -> Open, Done develop.
3. Done develop -> On test.
4. On test -> On develop, Done.
5. Done -> Closed, Open.

**Что нужно сделать**

1. Создайте задачу с типом bug, попытайтесь провести его по всему workflow до Done. 
1. Создайте задачу с типом epic, к ней привяжите несколько задач с типом task, проведите их по всему workflow до Done. 
1. При проведении обеих задач по статусам используйте kanban. 
1. Верните задачи в статус Open.
1. Перейдите в Scrum, запланируйте новый спринт, состоящий из задач эпика и одного бага, стартуйте спринт, проведите задачи до состояния Closed. Закройте спринт.
2. Если всё отработалось в рамках ожидания — выгрузите схемы workflow для импорта в XML. Файлы с workflow и скриншоты workflow приложите к решению задания.

## Решение



---
**BUG Workflow**

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE workflow PUBLIC "-//OpenSymphony Group//DTD OSWorkflow 2.8//EN" "http://www.opensymphony.com/osworkflow/workflow_2_8.dtd">
<workflow>
  <meta name="jira.description"></meta>
  <meta name="jira.update.author.id">6038d075f0327400688b4025</meta>
  <meta name="jira.update.author.key">6038d075f0327400688b4025</meta>
  <meta name="jira.updated.date">1672851919975</meta>
  <initial-actions>
    <action id="1" name="Create">
      <validators>
        <validator name="" type="class">
          <arg name="class.name">com.atlassian.jira.workflow.validator.PermissionValidator</arg>
          <arg name="permission">Create Issue</arg>
        </validator>
      </validators>
      <results>
        <unconditional-result old-status="null" status="open" step="1">
          <post-functions>
            <function type="class">
              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueCreateFunction</arg>
            </function>
            <function type="class">
              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
            </function>
            <function type="class">
              <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
              <arg name="eventTypeId">1</arg>
            </function>
          </post-functions>
        </unconditional-result>
      </results>
    </action>
  </initial-actions>
  <steps>
    <step id="1" name="Open">
      <meta name="jira.status.id">1</meta>
      <actions>
        <action id="11" name="to reproduce">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="2">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
      </actions>
    </step>
    <step id="2" name="on reproduce">
      <meta name="jira.status.id">10015</meta>
      <actions>
        <action id="21" name="back to open">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="1">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
        <action id="31" name="done reproduce">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="3">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
      </actions>
    </step>
    <step id="3" name="done reproduce">
      <meta name="jira.status.id">10016</meta>
      <actions>
        <action id="41" name="to fix">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="4">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
      </actions>
    </step>
    <step id="4" name="on fix">
      <meta name="jira.status.id">10017</meta>
      <actions>
        <action id="51" name="back to reproduce">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="2">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
        <action id="61" name="done fix">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="5">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
      </actions>
    </step>
    <step id="5" name="done fix">
      <meta name="jira.status.id">10018</meta>
      <actions>
        <action id="71" name="to test">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="6">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
      </actions>
    </step>
    <step id="6" name="on test">
      <meta name="jira.status.id">10013</meta>
      <actions>
        <action id="81" name="back to open">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="1">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
        <action id="91" name="to done">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="7">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
      </actions>
    </step>
    <step id="7" name="done">
      <meta name="jira.status.id">10014</meta>
      <actions>
        <action id="101" name="back to open">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="1">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
        <action id="111" name="close">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="8">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
      </actions>
    </step>
    <step id="8" name="Closed">
      <meta name="jira.status.id">6</meta>
    </step>
  </steps>
</workflow>
```
**Other Workflow**  


```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE workflow PUBLIC "-//OpenSymphony Group//DTD OSWorkflow 2.8//EN" "http://www.opensymphony.com/osworkflow/workflow_2_8.dtd">
<workflow>
  <meta name="jira.description"></meta>
  <meta name="jira.update.author.id">6038d075f0327400688b4025</meta>
  <meta name="jira.update.author.key">6038d075f0327400688b4025</meta>
  <meta name="jira.updated.date">1672851947712</meta>
  <initial-actions>
    <action id="1" name="Create">
      <validators>
        <validator name="" type="class">
          <arg name="class.name">com.atlassian.jira.workflow.validator.PermissionValidator</arg>
          <arg name="permission">Create Issue</arg>
        </validator>
      </validators>
      <results>
        <unconditional-result old-status="null" status="open" step="1">
          <post-functions>
            <function type="class">
              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueCreateFunction</arg>
            </function>
            <function type="class">
              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
            </function>
            <function type="class">
              <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
              <arg name="eventTypeId">1</arg>
            </function>
          </post-functions>
        </unconditional-result>
      </results>
    </action>
  </initial-actions>
  <steps>
    <step id="1" name="Open">
      <meta name="jira.status.id">1</meta>
      <actions>
        <action id="11" name="to develop">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="2">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
      </actions>
    </step>
    <step id="2" name="on develop">
      <meta name="jira.status.id">10011</meta>
      <actions>
        <action id="21" name="back to open">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="1">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
        <action id="31" name="done develop">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="3">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
      </actions>
    </step>
    <step id="3" name="done develop">
      <meta name="jira.status.id">10012</meta>
      <actions>
        <action id="41" name="to test">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="4">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
      </actions>
    </step>
    <step id="4" name="on test">
      <meta name="jira.status.id">10013</meta>
      <actions>
        <action id="51" name="back to develop">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="2">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
        <action id="61" name="done">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="5">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
      </actions>
    </step>
    <step id="5" name="done">
      <meta name="jira.status.id">10014</meta>
      <actions>
        <action id="71" name="back to open">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="1">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
        <action id="81" name="close">
          <meta name="jira.description"></meta>
          <meta name="jira.fieldscreen.id"></meta>
          <results>
            <unconditional-result old-status="null" status="null" step="6">
              <post-functions>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>
                </function>
                <function type="class">
                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>
                  <arg name="eventTypeId">13</arg>
                </function>
              </post-functions>
            </unconditional-result>
          </results>
        </action>
      </actions>
    </step>
    <step id="6" name="Closed">
      <meta name="jira.status.id">6</meta>
    </step>
  </steps>
</workflow>


```