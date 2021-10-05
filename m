Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 14607422143
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Oct 2021 10:51:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633423878;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d69/f9yXs4dDekRn8Tt55s3cR0YFhyWTWbUtN/7AhEs=;
	b=iKFLKzjl/qwDa7uYcuvGy35duFvmlNkDHtsDelYiWjXhnEWrwGyqOR87LyQHOTzuPgsAqr
	/M9DR5yPl5SFBomJzTaqGlrKllO+m9qru2hNXOhhTMGsOSirL+WR2tH1Ell5mzCsjFrIFi
	MkUS+U2k7QAPnAEbz+RhivQhl/MupFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-XeDX-cJGN_6XxU3Y6n4lfQ-1; Tue, 05 Oct 2021 04:51:17 -0400
X-MC-Unique: XeDX-cJGN_6XxU3Y6n4lfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E22B19057B1;
	Tue,  5 Oct 2021 08:51:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F305460C17;
	Tue,  5 Oct 2021 08:51:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFC0D4EA2A;
	Tue,  5 Oct 2021 08:51:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1958pD1E016273 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 04:51:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A4C5B60CC9; Tue,  5 Oct 2021 08:51:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C6EF60BF4;
	Tue,  5 Oct 2021 08:50:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Tue, 05 Oct 2021 09:50:54 +0100
Message-ID: <163342385474.876192.4489461265011092810.stgit@warthog.procyon.org.uk>
In-Reply-To: <163342376338.876192.10313278824682848704.stgit@warthog.procyon.org.uk>
References: <163342376338.876192.10313278824682848704.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-doc@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
	Mauro Carvalho Chehab <mchehab@kernel.org>, torvalds@linux-foundation.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH v3 4/5] fscache: Fix some kerneldoc warnings
	shown up by W=1
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix some kerneldoc warnings in the fscache driver that are shown up by W=1.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: Mauro Carvalho Chehab <mchehab@kernel.org>
cc: linux-fsdevel@vger.kernel.org
cc: linux-doc@vger.kernel.org
Link: https://lore.kernel.org/r/163214005516.2945267.7000234432243167892.stgit@warthog.procyon.org.uk/ # rfc v1
Link: https://lore.kernel.org/r/163281899704.2790286.9177774252843775348.stgit@warthog.procyon.org.uk/ # rfc v2
---

 fs/fscache/object.c    |    1 +
 fs/fscache/operation.c |    3 +++
 2 files changed, 4 insertions(+)

diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index f346a78f4bd6..7b9e7a366226 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -907,6 +907,7 @@ static void fscache_dequeue_object(struct fscache_object *object)
  * @object: The object to ask about
  * @data: The auxiliary data for the object
  * @datalen: The size of the auxiliary data
+ * @object_size: The size of the object according to the server.
  *
  * This function consults the netfs about the coherency state of an object.
  * The caller must be holding a ref on cookie->n_active (held by
diff --git a/fs/fscache/operation.c b/fs/fscache/operation.c
index 433877107700..e002cdfaf3cc 100644
--- a/fs/fscache/operation.c
+++ b/fs/fscache/operation.c
@@ -22,7 +22,10 @@ static void fscache_operation_dummy_cancel(struct fscache_operation *op)
 
 /**
  * fscache_operation_init - Do basic initialisation of an operation
+ * @cookie: The cookie to operate on
  * @op: The operation to initialise
+ * @processor: The function to perform the operation
+ * @cancel: A function to handle operation cancellation
  * @release: The release function to assign
  *
  * Do basic initialisation of an operation.  The caller must still set flags,


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

