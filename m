Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C53506CC1
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Apr 2022 14:48:24 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-fOUkFQ2dOaKdiQZRZf3T0Q-1; Tue, 19 Apr 2022 08:48:21 -0400
X-MC-Unique: fOUkFQ2dOaKdiQZRZf3T0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35120805F46;
	Tue, 19 Apr 2022 12:48:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BF202166B4F;
	Tue, 19 Apr 2022 12:48:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7E0CD1949763;
	Tue, 19 Apr 2022 12:48:19 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1D16E19451F0 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 16 Apr 2022 12:08:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EB936C44B0C; Sat, 16 Apr 2022 12:08:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7DFCC2810E
 for <linux-cachefs@redhat.com>; Sat, 16 Apr 2022 12:08:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD81B811E78
 for <linux-cachefs@redhat.com>; Sat, 16 Apr 2022 12:08:37 +0000 (UTC)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-AlqA22XSOkieK9Kh4ByHUw-1; Sat, 16 Apr 2022 08:08:34 -0400
X-MC-Unique: AlqA22XSOkieK9Kh4ByHUw-1
Received: from [2a02:8108:963f:de38:6624:6d8d:f790:d5c]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nfgl9-0000mk-RE; Sat, 16 Apr 2022 13:38:35 +0200
Message-ID: <c6b80014-846d-cd90-7e67-d72959ffabe1@leemhuis.info>
Date: Sat, 16 Apr 2022 13:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: Max Kellermann <mk@cm4all.com>, dhowells@redhat.com
References: <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1650110914;
 c3db739e
X-HE-SMSGID: 1nfgl9-0000mk-RE
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Tue, 19 Apr 2022 12:48:18 +0000
Subject: Re: [Linux-cachefs] fscache corruption in Linux 5.17?
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-kernel@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[TLDR: I'm adding the regression report below to regzbot, the Linux
kernel regression tracking bot; all text you find below is compiled from
a few templates paragraphs you might have encountered already already
from similar mails.]

Hi, this is your Linux kernel regression tracker. CCing the regression
mailing list, as it should be in the loop for all regressions, as
explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

On 12.04.22 17:10, Max Kellermann wrote:
> Hi David,
> 
> two weeks ago, I updated a cluster of web servers to Linux kernel
> 5.17.1 (5.16.x previously) which includes your rewrite of the fscache
> code.
> 
> In the last few days, there were numerous complaints about broken
> WordPress installations after WordPress was updated.  There were
> PHP syntax errors everywhere.
> 
> Indeed there were broken PHP files, but the interesting part is: those
> corruptions were only on one of the web servers; the others were fine,
> the file contents were only broken on one of the servers.
> 
> File size and time stamp and everyhing in "stat" is identical, just
> the file contents are corrupted; it looks like a mix of old and new
> contents.  The corruptions always started at multiples of 4096 bytes.
> 
> An example diff:
> 
>  --- ok/wp-includes/media.php    2022-04-06 05:51:50.000000000 +0200
>  +++ broken/wp-includes/media.php    2022-04-06 05:51:50.000000000 +0200
>  @@ -5348,7 +5348,7 @@
>                  /**
>                   * Filters the threshold for how many of the first content media elements to not lazy-load.
>                   *
>  -                * For these first content media elements, the `loading` attribute will be omitted. By default, this is the case
>  +                * For these first content media elements, the `loading` efault, this is the case
>                   * for only the very first content media element.
>                   *
>                   * @since 5.9.0
>  @@ -5377,3 +5377,4 @@
>   
>          return $content_media_count;
>   }
>  +^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@
> 
> The corruption can be explained by WordPress commit
> https://github.com/WordPress/WordPress/commit/07855db0ee8d5cff2 which
> makes the file 31 bytes longer (185055 -> 185086).  The "broken" web
> server sees the new contents until offset 184320 (= 45 * 4096), but
> sees the old contents from there on; followed by 31 null bytes
> (because the kernel reads past the end of the cache?).
> 
> All web servers mount a storage via NFSv3 with fscache.
> 
> My suspicion is that this is caused by a fscache regression in Linux
> 5.17.  What do you think?
> 
> What can I do to debug this further, is there any information you
> need?  I don't know much about how fscache works internally and how to
> obtain information.

Thx for the report. Maybe a bisection is what's needed here, but lets
see what David says, maybe he has a idea already.

To be sure below issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced v5.16..v5.17
#regzbot title fscache: file contents are corrupted
#regzbot ignore-activity

If it turns out this isn't a regression, free free to remove it from the
tracking by sending a reply to this thread containing a paragraph like
"#regzbot invalid: reason why this is invalid" (without the quotes).

Reminder for developers: when fixing the issue, please add a 'Link:'
tags pointing to the report (the mail quoted above) using
lore.kernel.org/r/, as explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'. Regzbot needs them to
automatically connect reports with fixes, but they are useful in
general, too.

I'm sending this to everyone that got the initial report, to make
everyone aware of the tracking. I also hope that messages like this
motivate people to directly get at least the regression mailing list and
ideally even regzbot involved when dealing with regressions, as messages
like this wouldn't be needed then. And don't worry, if I need to send
other mails regarding this regression only relevant for regzbot I'll
send them to the regressions lists only (with a tag in the subject so
people can filter them away). With a bit of luck no such messages will
be needed anyway.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

-- 
Additional information about regzbot:

If you want to know more about regzbot, check out its web-interface, the
getting start guide, and the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for reporters: when reporting a regression it's in your interest to
CC the regression list and tell regzbot about the issue, as that ensures
the regression makes it onto the radar of the Linux kernel's regression
tracker -- that's in your interest, as it ensures your report won't fall
through the cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot once
it's involved. Fix the issue as you normally would, just remember to
include 'Link:' tag in the patch descriptions pointing to all reports
about the issue. This has been expected from developers even before
regzbot showed up for reasons explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

