/// <summary>
/// Codeunit CourseInstallCode (ID 50100).
/// </summary>
codeunit 50100 CourseInstallCode
{
    // Set the codeunit to be an install codeunit. 
    Subtype = Install;

    // This trigger includes code for company-related operations. 
    trigger OnInstallAppPerCompany();
    var
        Course: Record "Course Infomation Table";
    begin
        // If the "Reward" table is empty, insert the default rewards.
        if Course.IsEmpty() then begin
            InsertDefaultCourse();
        end;
    end;

    // Insert the GOLD, SILVER, BRONZE reward levels
    /// <summary>
    /// InsertDefaultCourse.
    /// </summary>
    procedure InsertDefaultCourse();
    var
        e: Enum "Course Type";
    begin
        InsertCourse('80040', 'Installation & Configuration', 'Basic knowledge of installation and configuration', e::"Remote Training", 2, 1000, true, 5, 75);
        InsertCourse('80041', 'Finance', 'Basic knowledge of finance', e::"Remote Training", 3, 1500, true, 7, 80);
        InsertCourse('80042', 'C/SIDE Introduction', 'Introduction to programming', e::"Instructor Led", 5, 2500, true, 8, 80);
        InsertCourse('80043', 'Introduction', 'Introduction to Microsoft Dynamics 365 Business Central', e::"Instructor Led", 2, 1000, true, 4, 60);
        InsertCourse('80044', 'Application Setup', 'Basic knowledge of application setup', e::"e-Learning", 2, 1000, true, 5, 65);
        InsertCourse('80045', 'Business Intelligence', 'Basic knowledge of Business Intelligence', e::"e-Learning", 1, 500, true, 5, 65);
        InsertCourse('80046', 'C/SIDE Solution Development', 'Advanced topics in programming', e::"Instructor Led", 5, 2500, true, 10, 75);
    end;

    // Create and insert a reward level in the "Reward" table.
    /// <summary>
    /// InsertCourse.
    /// </summary>
    /// <param name="Code">Code[10].</param>
    /// <param name="Name">Text[30].</param>
    /// <param name="Description">Text[50].</param>
    /// <param name="Type">Enum "Course Type".</param>
    /// <param name="Duration">Decimal.</param>
    /// <param name="Price">Decimal.</param>
    /// <param name="Active">Boolean.</param>
    /// <param name="Difficulty">Integer.</param>
    /// <param name="Passing Rate">Integer.</param>
    procedure InsertCourse("Code": Code[10]; Name: Text[30]; Description: Text[70]; Type: Enum "Course Type"; "Duration": Decimal; Price: Decimal; Active: Boolean; Difficulty: Integer; "Passing Rate": Integer);
    var
        Course: Record "Course Infomation Table";
    begin
        Course.Init();
        Course."Code" := "Code";
        Course.Name := Name;
        Course.Description := Description;
        Course."Type" := "Type";
        Course."Duration" := "Duration";
        Course.Price := Price;
        Course.Active := Active;
        Course.Difficulty := Difficulty;
        Course."Passing Rate" := "Passing Rate";
        Course.Insert();
    end;

}