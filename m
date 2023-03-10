Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D86C6178
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Mar 2023 09:18:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679559530;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KcoWuk2W4CxOA1lkIHjRzX4LIVNG7/qQ8K9KGNNdUII=;
	b=f0cCLs8ZIz34FaCGS5Fz0YZmLXnvYx75ckfjsJTHqBiHl0NFjU8lybUBfjLZNA4YW2v08t
	yTH1D7UVnsETtGMQyX7Y+fkfXQbGqwp7SMpntoPHAY7r8H8Bm3yf7Xii0EePpMmHolSj3E
	rwSM5l3S7n6qJbu7ThbGEku5XtyW0rs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-TPLSRgcgOi65_VKQ5TA8ZQ-1; Thu, 23 Mar 2023 04:18:46 -0400
X-MC-Unique: TPLSRgcgOi65_VKQ5TA8ZQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD1CF858F0E;
	Thu, 23 Mar 2023 08:18:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C361483EC4;
	Thu, 23 Mar 2023 08:18:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E4AF81946A47;
	Thu, 23 Mar 2023 08:18:43 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F03E61946587 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 11 Mar 2023 00:04:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D140F492B05; Sat, 11 Mar 2023 00:04:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9B79492B04
 for <linux-cachefs@redhat.com>; Sat, 11 Mar 2023 00:04:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90E65185A78B
 for <linux-cachefs@redhat.com>; Sat, 11 Mar 2023 00:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-ykqnOZrBP3Gfh8u4Dd_Zvg-1; Fri, 10 Mar 2023 19:03:48 -0500
X-MC-Unique: ykqnOZrBP3Gfh8u4Dd_Zvg-1
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1paluB-00GaJN-BZ; Fri, 10 Mar 2023 23:12:07 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: dhowells@redhat.com, linux-cachefs@redhat.com, jack@suse.com,
 jaharkes@cs.cmu.edu, coda@cs.cmu.edu, codalist@coda.cs.cmu.edu,
 anton@tuxera.com, linux-ntfs-dev@lists.sourceforge.net
Date: Fri, 10 Mar 2023 15:12:06 -0800
Message-Id: <20230310231206.3952808-6-mcgrof@kernel.org>
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
Subject: [Linux-cachefs] [PATCH 5/5] ntfs: simplfy one-level sysctl
 registration for ntfs_sysctls
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is no need to declare an extra tables to just create directory,
this can be easily be done with a prefix path with register_sysctl().

Simplify this registration.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/ntfs/sysctl.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/fs/ntfs/sysctl.c b/fs/ntfs/sysctl.c
index a030d00af90c..174fe536a1c0 100644
--- a/fs/ntfs/sysctl.c
+++ b/fs/ntfs/sysctl.c
@@ -31,16 +31,6 @@ static struct ctl_table ntfs_sysctls[] = {
 	{}
 };
 
-/* Define the parent directory /proc/sys/fs. */
-static struct ctl_table sysctls_root[] = {
-	{
-		.procname	= "fs",
-		.mode		= 0555,
-		.child		= ntfs_sysctls
-	},
-	{}
-};
-
 /* Storage for the sysctls header. */
 static struct ctl_table_header *sysctls_root_table;
 
@@ -54,7 +44,7 @@ int ntfs_sysctl(int add)
 {
 	if (add) {
 		BUG_ON(sysctls_root_table);
-		sysctls_root_table = register_sysctl_table(sysctls_root);
+		sysctls_root_table = register_sysctl("fs", ntfs_sysctls);
 		if (!sysctls_root_table)
 			return -ENOMEM;
 	} else {
-- 
2.39.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

