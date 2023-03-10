Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 435CB6C6179
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Mar 2023 09:18:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679559531;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oEM/3VJd5/lnUlvRE1hbHtts0flvsxOvsi+yyq6laOY=;
	b=XOpfLGh5XtjYqSB7FlICgXCaSFaNyqUFHXnhD7aQ5oB7oLwXV+n1e0bqMtRh74KffPhjiK
	W/Rg0/LaBT/g/X5WksyVKB5UU4KD6ol/jLpBKN76ud2E/p7Jy3bScf/1zUOoTB+GqzO5XN
	qF7ony3RPfCKo/lbP+19mN2oiwkyqvc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-PmomMHrKN0Wpq0IEZEc9tQ-1; Thu, 23 Mar 2023 04:18:46 -0400
X-MC-Unique: PmomMHrKN0Wpq0IEZEc9tQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDAE129ABA0E;
	Thu, 23 Mar 2023 08:18:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C02B4024CA2;
	Thu, 23 Mar 2023 08:18:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D59261946A43;
	Thu, 23 Mar 2023 08:18:43 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C8D701946587 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 11 Mar 2023 00:04:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 815CB492B05; Sat, 11 Mar 2023 00:04:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A385492B04
 for <linux-cachefs@redhat.com>; Sat, 11 Mar 2023 00:04:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DB7429AA2DA
 for <linux-cachefs@redhat.com>; Sat, 11 Mar 2023 00:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-55Il6BKsOsufye7Lypw-vw-1; Fri, 10 Mar 2023 19:04:01 -0500
X-MC-Unique: 55Il6BKsOsufye7Lypw-vw-1
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1paluB-00GaJJ-92; Fri, 10 Mar 2023 23:12:07 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: dhowells@redhat.com, linux-cachefs@redhat.com, jack@suse.com,
 jaharkes@cs.cmu.edu, coda@cs.cmu.edu, codalist@coda.cs.cmu.edu,
 anton@tuxera.com, linux-ntfs-dev@lists.sourceforge.net
Date: Fri, 10 Mar 2023 15:12:04 -0800
Message-Id: <20230310231206.3952808-4-mcgrof@kernel.org>
In-Reply-To: <20230310231206.3952808-1-mcgrof@kernel.org>
References: <20230310231206.3952808-1-mcgrof@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Thu, 23 Mar 2023 08:18:42 +0000
Subject: [Linux-cachefs] [PATCH 3/5] quota: simplify two-level sysctl
 registration for fs_dqstats_table
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
Cc: j.granados@samsung.com, keescook@chromium.org, patches@lists.linux.dev,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 ebiederm@xmission.com, linux-fsdevel@vger.kernel.org, yzaikin@google.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is no need to declare two tables to just create directories,
this can be easily be done with a prefix path with register_sysctl().

Simplify this registration.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/quota/dquot.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index a6357f728034..90cb70c82012 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -2948,24 +2948,6 @@ static struct ctl_table fs_dqstats_table[] = {
 	{ },
 };
 
-static struct ctl_table fs_table[] = {
-	{
-		.procname	= "quota",
-		.mode		= 0555,
-		.child		= fs_dqstats_table,
-	},
-	{ },
-};
-
-static struct ctl_table sys_table[] = {
-	{
-		.procname	= "fs",
-		.mode		= 0555,
-		.child		= fs_table,
-	},
-	{ },
-};
-
 static int __init dquot_init(void)
 {
 	int i, ret;
@@ -2973,7 +2955,7 @@ static int __init dquot_init(void)
 
 	printk(KERN_NOTICE "VFS: Disk quotas %s\n", __DQUOT_VERSION__);
 
-	register_sysctl_table(sys_table);
+	register_sysctl("fs/quota", fs_dqstats_table);
 
 	dquot_cachep = kmem_cache_create("dquot",
 			sizeof(struct dquot), sizeof(unsigned long) * 4,
-- 
2.39.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

