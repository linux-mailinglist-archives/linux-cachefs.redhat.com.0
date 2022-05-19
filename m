Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A2752D5C1
	for <lists+linux-cachefs@lfdr.de>; Thu, 19 May 2022 16:16:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652969817;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZVu9wIkiXXGl8FgYIW1AQh7ZarJhBqVvN3a9MnRE358=;
	b=DwdN4qpW/t3J32HnIWp8J6FezuI7+0Ows/MLU+SUnoAvLmF63v5jEc4QqYDghjr6GK1svn
	dplzqAasVCFg+tsCFlL0qHzynOVgd5JTinRk/C/Qac4QVO16NldtQyMWJx3T6zREf0C6o/
	ls1RHIcm1Tk6kq5uLIOMjcZOkjFl0Rg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427--Lh2mzipNjaaOcM3WpEsPA-1; Thu, 19 May 2022 10:16:54 -0400
X-MC-Unique: -Lh2mzipNjaaOcM3WpEsPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B5123C11A02;
	Thu, 19 May 2022 14:16:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 504557B7C;
	Thu, 19 May 2022 14:16:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EAADC194975B;
	Thu, 19 May 2022 14:16:52 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 34748194705A for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 19 May 2022 14:16:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 17DF940CF8F7; Thu, 19 May 2022 14:16:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75AA340CF8ED;
 Thu, 19 May 2022 14:16:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: jlayton@kernel.org
Date: Thu, 19 May 2022 15:16:49 +0100
Message-ID: <165296980976.3595490.4887936702439978407.stgit@warthog.procyon.org.uk>
In-Reply-To: <165296980082.3595490.3561111064004493810.stgit@warthog.procyon.org.uk>
References: <165296980082.3595490.3561111064004493810.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH 2/2] netfs: Export netfs_put_subrequest()
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
Cc: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Export netfs_put_subrequest() and a couple of tracepoints.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
---

 fs/netfs/main.c    |    3 +++
 fs/netfs/objects.c |    1 +
 2 files changed, 4 insertions(+)

diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 068568702957..3d0283f8d0b9 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -15,6 +15,9 @@ MODULE_DESCRIPTION("Network fs support");
 MODULE_AUTHOR("Red Hat, Inc.");
 MODULE_LICENSE("GPL");
 
+EXPORT_TRACEPOINT_SYMBOL(netfs_rreq);
+EXPORT_TRACEPOINT_SYMBOL(netfs_sreq);
+
 unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index d6b8c0cbeb7c..cbc40d052b46 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -160,3 +160,4 @@ void netfs_put_subrequest(struct netfs_io_subrequest *subreq, bool was_async,
 	if (dead)
 		netfs_free_subrequest(subreq, was_async);
 }
+EXPORT_SYMBOL(netfs_put_subrequest);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

