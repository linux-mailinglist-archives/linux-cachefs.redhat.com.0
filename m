Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DFF6C6177
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Mar 2023 09:18:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679559530;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=esif1A4ZniyYr0rgS0k7BeVCGlB3NXxvmiheg4kV9FA=;
	b=VvRUdMLq1cQTcy4N8w1lUJgkl5rwFCZaI9AtA0suhFvENYs/vHVHHf6O3Tn6CI5J3UVTus
	32qAvYuCKUftsVr+M0ctaAanYKMhfpkYLYDt/DNuImYcGSgQv19KBJtV4ub0eoakjfvgrH
	93R/IlI2jtOkkr2Di7zizGkO9PymeNY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-M0PK0HstOQe84_8vkV3iDA-1; Thu, 23 Mar 2023 04:18:46 -0400
X-MC-Unique: M0PK0HstOQe84_8vkV3iDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD208185A7A8;
	Thu, 23 Mar 2023 08:18:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C6D7112132E;
	Thu, 23 Mar 2023 08:18:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0CF5E1946A54;
	Thu, 23 Mar 2023 08:18:44 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A3B3F1946A63 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 11 Mar 2023 00:04:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8982AC15BAD; Sat, 11 Mar 2023 00:04:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 821F0C15BA0
 for <linux-cachefs@redhat.com>; Sat, 11 Mar 2023 00:04:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6741F185A794
 for <linux-cachefs@redhat.com>; Sat, 11 Mar 2023 00:04:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-j6HV-5EFNcWnVFTYfYLLqg-1; Fri, 10 Mar 2023 19:04:11 -0500
X-MC-Unique: j6HV-5EFNcWnVFTYfYLLqg-1
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1paluB-00GaJH-7h; Fri, 10 Mar 2023 23:12:07 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: dhowells@redhat.com, linux-cachefs@redhat.com, jack@suse.com,
 jaharkes@cs.cmu.edu, coda@cs.cmu.edu, codalist@coda.cs.cmu.edu,
 anton@tuxera.com, linux-ntfs-dev@lists.sourceforge.net
Date: Fri, 10 Mar 2023 15:12:03 -0800
Message-Id: <20230310231206.3952808-3-mcgrof@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Thu, 23 Mar 2023 08:18:42 +0000
Subject: [Linux-cachefs] [PATCH 2/5] devpts: simplify two-level sysctl
 registration for pty_kern_table
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is no need to declare two tables to just create directories,
this can be easily be done with a prefix path with register_sysctl().

Simplify this registration.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/devpts/inode.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/fs/devpts/inode.c b/fs/devpts/inode.c
index 4f25015aa534..fe3db0eda8e4 100644
--- a/fs/devpts/inode.c
+++ b/fs/devpts/inode.c
@@ -72,24 +72,6 @@ static struct ctl_table pty_table[] = {
 	{}
 };
 
-static struct ctl_table pty_kern_table[] = {
-	{
-		.procname	= "pty",
-		.mode		= 0555,
-		.child		= pty_table,
-	},
-	{}
-};
-
-static struct ctl_table pty_root_table[] = {
-	{
-		.procname	= "kernel",
-		.mode		= 0555,
-		.child		= pty_kern_table,
-	},
-	{}
-};
-
 struct pts_mount_opts {
 	int setuid;
 	int setgid;
@@ -630,7 +612,7 @@ static int __init init_devpts_fs(void)
 {
 	int err = register_filesystem(&devpts_fs_type);
 	if (!err) {
-		register_sysctl_table(pty_root_table);
+		register_sysctl("kernel/pty", pty_table);
 	}
 	return err;
 }
-- 
2.39.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

