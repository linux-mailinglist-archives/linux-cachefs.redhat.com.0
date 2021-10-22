Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B943437D01
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929260;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zcqdstOft+DKh+sIHDhUi8GZiQcfFGMrxi4fa9INPpo=;
	b=alFcAmYsfrvMzmnQk7HTp84WvriJMu8C70eN/LHYlsikBXwBywaPahBEhpSaYBa1NP0z3D
	7M6D71g1MXt4ZC/WK0ZmiA2pc6aLlZsKdq3CIVclj76cwuI7nvMx7cbcvZELcYIlW3v+SA
	rlAksFhuvcMedsOdqDQjiniSqRx1mpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-02GrP7mENX6bcM96UhZjaA-1; Fri, 22 Oct 2021 15:00:57 -0400
X-MC-Unique: 02GrP7mENX6bcM96UhZjaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 186AA80668A;
	Fri, 22 Oct 2021 19:00:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B1BE69C83;
	Fri, 22 Oct 2021 19:00:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB5501800B9E;
	Fri, 22 Oct 2021 19:00:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJ0rFo011922 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:00:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 452665F4E9; Fri, 22 Oct 2021 19:00:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 258BC6A916;
	Fri, 22 Oct 2021 19:00:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:00:02 +0100
Message-ID: <163492920230.1038219.499626497892850661.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Jeff Layton <jlayton@kernel.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH v2 06/53] netfs: Pass a flag to
 ->prepare_write() to say if there's no alloc'd space
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Pass a flag to ->prepare_write() to indicate if there's definitely no
space allocated in the cache yet (for instance if we've already checked as
we were asked to do a read).

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/cachefiles_old/io.c |    3 ++-
 fs/netfs/read_helper.c |    2 +-
 include/linux/netfs.h  |    3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/cachefiles_old/io.c b/fs/cachefiles_old/io.c
index 5ead97de4bb7..eab8641de994 100644
--- a/fs/cachefiles_old/io.c
+++ b/fs/cachefiles_old/io.c
@@ -341,7 +341,8 @@ static enum netfs_read_source cachefiles_prepare_read(struct netfs_read_subreque
  * Prepare for a write to occur.
  */
 static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
-				    loff_t *_start, size_t *_len, loff_t i_size)
+				    loff_t *_start, size_t *_len, loff_t i_size,
+				    bool no_space_allocated_yet)
 {
 	loff_t start = *_start;
 	size_t len = *_len, down;
diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index dfc60c79a9f3..80f8e334371d 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -323,7 +323,7 @@ static void netfs_rreq_do_write_to_cache(struct netfs_read_request *rreq)
 		}
 
 		ret = cres->ops->prepare_write(cres, &subreq->start, &subreq->len,
-					       rreq->i_size);
+					       rreq->i_size, true);
 		if (ret < 0) {
 			trace_netfs_failure(rreq, subreq, ret, netfs_fail_prepare_write);
 			trace_netfs_sreq(subreq, netfs_sreq_trace_write_skip);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 014fb502fd91..99137486d351 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -220,7 +220,8 @@ struct netfs_cache_ops {
 	 * actually do.
 	 */
 	int (*prepare_write)(struct netfs_cache_resources *cres,
-			     loff_t *_start, size_t *_len, loff_t i_size);
+			     loff_t *_start, size_t *_len, loff_t i_size,
+			     bool no_space_allocated_yet);
 
 	/* Prepare a write operation for the fallback fscache API, working out
 	 * whether we can cache a page or not.


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

