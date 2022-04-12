Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA6C4FE473
	for <lists+linux-cachefs@lfdr.de>; Tue, 12 Apr 2022 17:16:22 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-b_RDDkVWPl6EwaoWcinOvw-1; Tue, 12 Apr 2022 11:16:18 -0400
X-MC-Unique: b_RDDkVWPl6EwaoWcinOvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 005E219705AA;
	Tue, 12 Apr 2022 15:16:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1EF640D1B98;
	Tue, 12 Apr 2022 15:16:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 643CC1940374;
	Tue, 12 Apr 2022 15:16:16 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 90D5C1940365 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 12 Apr 2022 15:16:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6E4F940CFD1E; Tue, 12 Apr 2022 15:16:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A37F40CFD20
 for <linux-cachefs@redhat.com>; Tue, 12 Apr 2022 15:16:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3816138149AD
 for <linux-cachefs@redhat.com>; Tue, 12 Apr 2022 15:16:15 +0000 (UTC)
Received: from nibbler.cm4all.net (nibbler.cm4all.net [82.165.145.151]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-4D2pVMa3N7-kvwVav1WfZg-1; Tue, 12 Apr 2022 11:16:13 -0400
X-MC-Unique: 4D2pVMa3N7-kvwVav1WfZg-1
Received: from localhost (localhost [127.0.0.1])
 by nibbler.cm4all.net (Postfix) with ESMTP id 84E83C00D5
 for <linux-cachefs@redhat.com>; Tue, 12 Apr 2022 17:10:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at nibbler.cm4all.net
Received: from nibbler.cm4all.net ([127.0.0.1])
 by localhost (nibbler.cm4all.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id X7nMs9iOsmsi for <linux-cachefs@redhat.com>;
 Tue, 12 Apr 2022 17:10:38 +0200 (CEST)
Received: from zero.intern.cm-ag (zero.intern.cm-ag [172.30.16.10])
 by nibbler.cm4all.net (Postfix) with SMTP id 5D4F4C0093
 for <linux-cachefs@redhat.com>; Tue, 12 Apr 2022 17:10:38 +0200 (CEST)
Received: (qmail 29504 invoked from network); 12 Apr 2022 20:59:24 +0200
Received: from unknown (HELO rabbit.intern.cm-ag) (172.30.3.1)
 by zero.intern.cm-ag with SMTP; 12 Apr 2022 20:59:24 +0200
Received: by rabbit.intern.cm-ag (Postfix, from userid 1023)
 id 329E3460C77; Tue, 12 Apr 2022 17:10:38 +0200 (CEST)
Date: Tue, 12 Apr 2022 17:10:38 +0200
From: Max Kellermann <mk@cm4all.com>
To: dhowells@redhat.com
Message-ID: <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] fscache corruption in Linux 5.17?
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
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

two weeks ago, I updated a cluster of web servers to Linux kernel
5.17.1 (5.16.x previously) which includes your rewrite of the fscache
code.

In the last few days, there were numerous complaints about broken
WordPress installations after WordPress was updated.  There were
PHP syntax errors everywhere.

Indeed there were broken PHP files, but the interesting part is: those
corruptions were only on one of the web servers; the others were fine,
the file contents were only broken on one of the servers.

File size and time stamp and everyhing in "stat" is identical, just
the file contents are corrupted; it looks like a mix of old and new
contents.  The corruptions always started at multiples of 4096 bytes.

An example diff:

 --- ok/wp-includes/media.php    2022-04-06 05:51:50.000000000 +0200
 +++ broken/wp-includes/media.php    2022-04-06 05:51:50.000000000 +0200
 @@ -5348,7 +5348,7 @@
                 /**
                  * Filters the threshold for how many of the first content media elements to not lazy-load.
                  *
 -                * For these first content media elements, the `loading` attribute will be omitted. By default, this is the case
 +                * For these first content media elements, the `loading` efault, this is the case
                  * for only the very first content media element.
                  *
                  * @since 5.9.0
 @@ -5377,3 +5377,4 @@
  
         return $content_media_count;
  }
 +^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@

The corruption can be explained by WordPress commit
https://github.com/WordPress/WordPress/commit/07855db0ee8d5cff2 which
makes the file 31 bytes longer (185055 -> 185086).  The "broken" web
server sees the new contents until offset 184320 (= 45 * 4096), but
sees the old contents from there on; followed by 31 null bytes
(because the kernel reads past the end of the cache?).

All web servers mount a storage via NFSv3 with fscache.

My suspicion is that this is caused by a fscache regression in Linux
5.17.  What do you think?

What can I do to debug this further, is there any information you
need?  I don't know much about how fscache works internally and how to
obtain information.

Max

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

