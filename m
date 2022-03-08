Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F19874D24CB
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 00:25:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646781952;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9QaFeFnmbOdEuemUV2yXKC/M/ncT85PqMtIJHIN+5Vs=;
	b=DPJTbZg/jjNY7RxNq08m0o6gaNf/0K0c1IdxKlHMfHlIKn2yAgn9V3bNqWoDU/gCntMiWy
	reFbrERBqGMaQIOiYgyZtfdlr+ak5WmKSJ5MbZfT4eE9MZJzrok8koeDCMxLv1fV70h94V
	58dDESZFwnDHVcwybMO7C19Gdux8DmQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-3WAgOFZqOPiq6pCnjYSrJA-1; Tue, 08 Mar 2022 18:25:49 -0500
X-MC-Unique: 3WAgOFZqOPiq6pCnjYSrJA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 692A83C163E7;
	Tue,  8 Mar 2022 23:25:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2011B463EA3;
	Tue,  8 Mar 2022 23:25:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BD67B1932137;
	Tue,  8 Mar 2022 23:25:47 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AAFC9194F4AE for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  8 Mar 2022 23:25:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 545454CECE; Tue,  8 Mar 2022 23:25:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66E2C2D1F4;
 Tue,  8 Mar 2022 23:25:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 08 Mar 2022 23:25:24 +0000
Message-ID: <164678192454.1200972.4428834328108580460.stgit@warthog.procyon.org.uk>
In-Reply-To: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Subject: [Linux-cachefs] [PATCH v2 02/19] netfs: Generate enums from trace
 symbol mapping lists
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
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

netfs has a number of lists of symbols for use in tracing, listed in an
enum and then listed again in a symbol->string mapping for use with
__print_symbolic().  This is, however, redundant.

Instead, use the symbol->string mapping list to also generate the enum
where the enum is in the same file.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com

Link: https://lore.kernel.org/r/164622980839.3564931.5673300162465266909.stgit@warthog.procyon.org.uk/ # v1
---

 include/trace/events/netfs.h |   57 ++++++++++--------------------------------
 1 file changed, 14 insertions(+), 43 deletions(-)

diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index e6f4ebbb4c69..88d9a74dd346 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -15,49 +15,6 @@
 /*
  * Define enums for tracing information.
  */
-#ifndef __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
-#define __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
-
-enum netfs_read_trace {
-	netfs_read_trace_expanded,
-	netfs_read_trace_readahead,
-	netfs_read_trace_readpage,
-	netfs_read_trace_write_begin,
-};
-
-enum netfs_rreq_trace {
-	netfs_rreq_trace_assess,
-	netfs_rreq_trace_done,
-	netfs_rreq_trace_free,
-	netfs_rreq_trace_resubmit,
-	netfs_rreq_trace_unlock,
-	netfs_rreq_trace_unmark,
-	netfs_rreq_trace_write,
-};
-
-enum netfs_sreq_trace {
-	netfs_sreq_trace_download_instead,
-	netfs_sreq_trace_free,
-	netfs_sreq_trace_prepare,
-	netfs_sreq_trace_resubmit_short,
-	netfs_sreq_trace_submit,
-	netfs_sreq_trace_terminated,
-	netfs_sreq_trace_write,
-	netfs_sreq_trace_write_skip,
-	netfs_sreq_trace_write_term,
-};
-
-enum netfs_failure {
-	netfs_fail_check_write_begin,
-	netfs_fail_copy_to_cache,
-	netfs_fail_read,
-	netfs_fail_short_readpage,
-	netfs_fail_short_write_begin,
-	netfs_fail_prepare_write,
-};
-
-#endif
-
 #define netfs_read_traces					\
 	EM(netfs_read_trace_expanded,		"EXPANDED ")	\
 	EM(netfs_read_trace_readahead,		"READAHEAD")	\
@@ -98,6 +55,20 @@ enum netfs_failure {
 	EM(netfs_fail_short_write_begin,	"short-write-begin")	\
 	E_(netfs_fail_prepare_write,		"prep-write")
 
+#ifndef __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
+#define __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
+
+#undef EM
+#undef E_
+#define EM(a, b) a,
+#define E_(a, b) a
+
+enum netfs_read_trace { netfs_read_traces } __mode(byte);
+enum netfs_rreq_trace { netfs_rreq_traces } __mode(byte);
+enum netfs_sreq_trace { netfs_sreq_traces } __mode(byte);
+enum netfs_failure { netfs_failures } __mode(byte);
+
+#endif
 
 /*
  * Export enum symbols via userspace.


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

