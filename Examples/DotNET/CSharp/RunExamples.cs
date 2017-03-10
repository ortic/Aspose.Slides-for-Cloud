using System;
using System.Collections.Generic;
using System.IO;
using System.Configuration;
using Document;
using Shapes;
using Images;
using Text;
using Document_Properties;
using Slides;

namespace CSharp
{
    class RunExamples
    {
        [STAThread]
        public static void Main()
        {
            Console.WriteLine("Open RunExamples.cs. \nIn Main() method uncomment the example that you want to run.");
            Console.WriteLine("=====================================================");

            // Uncomment the one you want to try out

            //// =====================================================
            //// =====================================================
            //// Document
            //// =====================================================
            //// =====================================================

            ConvertToOtherFormat.Run();   
            //ConvertToOtherFormatUsingStorage.Run();
            //ConvertToOtherFormatUsingThirdPartyStorage.Run();
            //MergePresentations.Run();
            //MergeSelectedSlides.Run();
            //CreateEmptyPresentation.Run();
            //ConvertToOtherFormatWithAdditionalSettings.Run();
            //SplitPresentation.Run();

            //// =====================================================
            //// =====================================================
            //// Shapes
            //// =====================================================
            //// =====================================================

            //ExtractShapes.Run();
            //GetParticularShape.Run();
            //ExtractShapeUsingThirdPartyStorage.Run();

            //// =====================================================
            //// =====================================================
            //// Images
            //// =====================================================
            //// =====================================================

            //GetNumberOfImagesInPresentation.Run();
            //GetNumberOfImagesInSlide.Run();
            //GetNumberOfImagesInPresentationUsingThirdPartyStorage.Run();
            //GetNumberOfImagesInSlideUsingThirdPartyStorage.Run();

            //// =====================================================
            //// =====================================================
            //// Text
            //// =====================================================
            //// =====================================================

            //GetAllTextItems.Run();
            //GetAllTextItemsFromSlide.Run();
            //ReplaceAllInstancesInPresentation.Run();
            //ReplaceAllInstancesInSlide.Run();
            //GetAllTextItemsUsingThirdPartyStorage.Run();
            //GetAllTextItemsFromSlideUsingThirdPartyStorage.Run();

            //// =====================================================
            //// =====================================================
            //// Document-Properties
            //// =====================================================
            //// =====================================================

            //GetProperties.Run();
            //RemoveProperties.Run();
            //SetProperty.Run();

            //// =====================================================
            //// =====================================================
            //// Slides
            //// =====================================================
            //// =====================================================

            //SaveAsImageWithDefaultSize.Run();
            //SaveAsImageWithSpecifiedSize.Run();
            //DetectAllSlides.Run();
            //GetSlideCount.Run();
            //GetPlaceholderCount.Run();
            //GetPlaceholder.Run();
            //GetSlideColorScheme.Run();
            //GetSlideFontScheme.Run();
            //AddNewSlide.Run();
            //CopySlides.Run();
            //GetSlideBackground.Run();
            //DetectSlideBackground.Run();
            //GetComments.Run();
            //GetAspectRatio.Run();
            //SaveAsImageWithDefaultSizeUsingThirdPartyStorage.Run();
            //SaveAsImageWithSpecifiedSizeUsingThirdPartyStorage.Run();
            //DetectSlidesUsingThirdPartyStorage.Run();
            //GetSlideCountUsingThirdPartyStorage.Run();
            
            // Stop before exiting
            Console.WriteLine("\n\nProgram Finished. Press any key to exit....");
            Console.ReadKey();
        }
        
    }
}
