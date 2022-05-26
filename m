Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A4F535407
	for <lists+linux-cachefs@lfdr.de>; Thu, 26 May 2022 21:39:39 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-494gzBJdOE65SlBZNURPqg-1; Thu, 26 May 2022 15:39:36 -0400
X-MC-Unique: 494gzBJdOE65SlBZNURPqg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACDA3811E75;
	Thu, 26 May 2022 19:39:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47ED2492CA2;
	Thu, 26 May 2022 19:39:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0B958193212A;
	Thu, 26 May 2022 19:39:34 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B0B7B1947051 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 26 May 2022 19:39:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7DA582026D07; Thu, 26 May 2022 19:39:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79E602026D64
 for <linux-cachefs@redhat.com>; Thu, 26 May 2022 19:39:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FBC41C01B36
 for <linux-cachefs@redhat.com>; Thu, 26 May 2022 19:39:32 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-lP_votZGPliYQBPOVtdNCA-1; Thu, 26 May 2022 15:39:25 -0400
X-MC-Unique: lP_votZGPliYQBPOVtdNCA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nuJKN-001VJP-SW; Thu, 26 May 2022 19:39:23 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: David Howells <dhowells@redhat.com>,
	linux-cachefs@redhat.com
Date: Thu, 26 May 2022 20:39:21 +0100
Message-Id: <20220526193921.358577-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH] netfs: Remove extern from function
 prototypes
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The 'extern' keyword is not necessary and removing it lets us shorten
some lines.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/netfs.h | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 77fa6a61706a..8c1c575c6fae 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -274,18 +274,17 @@ struct netfs_cache_ops {
 };
 
 struct readahead_control;
-extern void netfs_readahead(struct readahead_control *);
+void netfs_readahead(struct readahead_control *);
 int netfs_read_folio(struct file *, struct folio *);
-extern int netfs_write_begin(struct file *, struct address_space *,
-			     loff_t, unsigned int, struct folio **,
-			     void **);
-
-extern void netfs_subreq_terminated(struct netfs_io_subrequest *, ssize_t, bool);
-extern void netfs_get_subrequest(struct netfs_io_subrequest *subreq,
-				 enum netfs_sreq_ref_trace what);
-extern void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
-				 bool was_async, enum netfs_sreq_ref_trace what);
-extern void netfs_stats_show(struct seq_file *);
+int netfs_write_begin(struct file *, struct address_space *, loff_t pos,
+		      unsigned int len, struct folio **, void **fsdata);
+
+void netfs_subreq_terminated(struct netfs_io_subrequest *, ssize_t, bool);
+void netfs_get_subrequest(struct netfs_io_subrequest *subreq,
+			  enum netfs_sreq_ref_trace what);
+void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
+			  bool was_async, enum netfs_sreq_ref_trace what);
+void netfs_stats_show(struct seq_file *);
 
 /**
  * netfs_i_context - Get the netfs inode context from the inode
-- 
2.34.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

