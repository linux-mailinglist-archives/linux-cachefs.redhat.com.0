Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 50174358697
	for <lists+linux-cachefs@lfdr.de>; Thu,  8 Apr 2021 16:14:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617891284;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uBvp4w7rq/IpdEfB4/yWYLRNRR0+6RSTbUV+dIIxIkk=;
	b=U2NZiAQQQEsl6tzzwPEKely25L7px1YCTFTn/L7d/KIhmGshmrkvaEYYAAsTp/c7z+ZoPl
	Q1GV0ZTvrgN2MY9IOwj0/DblfPRYsQP4tM/IzhysH4LEXY9ZmO6DkVGfph6I9yWR2DlLZj
	UyTkd8VO4y2R6ZJ2ngpb2NGRbJRSTX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-ullFpKGINpe5-Hj19z44sQ-1; Thu, 08 Apr 2021 10:14:41 -0400
X-MC-Unique: ullFpKGINpe5-Hj19z44sQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50EDF8143FE;
	Thu,  8 Apr 2021 14:14:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07D5819702;
	Thu,  8 Apr 2021 14:14:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE20A1806D12;
	Thu,  8 Apr 2021 14:14:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 138E8c9n027617 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 8 Apr 2021 10:08:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 473D25C1C5; Thu,  8 Apr 2021 14:08:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F315E5C1D0;
	Thu,  8 Apr 2021 14:08:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu, 08 Apr 2021 15:08:28 +0100
Message-ID: <161789090823.6155.15673999934535049102.stgit@warthog.procyon.org.uk>
In-Reply-To: <161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
References: <161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 08 Apr 2021 10:14:30 -0400
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [Linux-cachefs] [PATCH v6 21/30] afs: Don't truncate iter during
	data fetch
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't truncate the iterator to correspond to the actual data size when
fetching the data from the server - rather, pass the length we want to read
to rxrpc.

This will allow the clear-after-read code in future to simply clear the
remaining iterator capacity rather than having to reinitialise the
iterator.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/r/158861249201.340223.13035445866976590375.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/159465825061.1377938.14403904452300909320.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/160588531418.3465195.10712005940763063144.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161118148567.1232039.13380313332292947956.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161161044610.2537118.17908520793806837792.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/161340407907.1303470.6501394859511712746.stgit@warthog.procyon.org.uk/ # v3
Link: https://lore.kernel.org/r/161539551721.286939.14655713136572200716.stgit@warthog.procyon.org.uk/ # v4
Link: https://lore.kernel.org/r/161653807790.2770958.14034599989374173734.stgit@warthog.procyon.org.uk/ # v5
---

 fs/afs/fsclient.c      |    6 ++++--
 fs/afs/internal.h      |    6 ++++++
 fs/afs/rxrpc.c         |   13 +++++++++----
 fs/afs/yfsclient.c     |    6 ++++--
 include/net/af_rxrpc.h |    2 +-
 net/rxrpc/recvmsg.c    |    9 +++++----
 6 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 1d95ed9dd86e..4a57c6c6f12b 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -305,8 +305,9 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 	unsigned int size;
 	int ret;
 
-	_enter("{%u,%zu/%llu}",
-	       call->unmarshall, iov_iter_count(call->iter), req->actual_len);
+	_enter("{%u,%zu,%zu/%llu}",
+	       call->unmarshall, call->iov_len, iov_iter_count(call->iter),
+	       req->actual_len);
 
 	switch (call->unmarshall) {
 	case 0:
@@ -343,6 +344,7 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 			size = PAGE_SIZE - req->offset;
 		else
 			size = req->remain;
+		call->iov_len = size;
 		call->bvec[0].bv_len = size;
 		call->bvec[0].bv_offset = req->offset;
 		call->bvec[0].bv_page = req->pages[req->index];
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 995fef267be7..7b8306d8e81e 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -104,6 +104,7 @@ struct afs_call {
 	struct afs_server	*server;	/* The fileserver record if fs op (pins ref) */
 	struct afs_vlserver	*vlserver;	/* The vlserver record if vl op */
 	void			*request;	/* request data (first part) */
+	size_t			iov_len;	/* Size of *iter to be used */
 	struct iov_iter		def_iter;	/* Default buffer/data iterator */
 	struct iov_iter		*iter;		/* Iterator currently in use */
 	union {	/* Convenience for ->def_iter */
@@ -1271,6 +1272,7 @@ static inline void afs_make_op_call(struct afs_operation *op, struct afs_call *c
 
 static inline void afs_extract_begin(struct afs_call *call, void *buf, size_t size)
 {
+	call->iov_len = size;
 	call->kvec[0].iov_base = buf;
 	call->kvec[0].iov_len = size;
 	iov_iter_kvec(&call->def_iter, READ, call->kvec, 1, size);
@@ -1278,21 +1280,25 @@ static inline void afs_extract_begin(struct afs_call *call, void *buf, size_t si
 
 static inline void afs_extract_to_tmp(struct afs_call *call)
 {
+	call->iov_len = sizeof(call->tmp);
 	afs_extract_begin(call, &call->tmp, sizeof(call->tmp));
 }
 
 static inline void afs_extract_to_tmp64(struct afs_call *call)
 {
+	call->iov_len = sizeof(call->tmp64);
 	afs_extract_begin(call, &call->tmp64, sizeof(call->tmp64));
 }
 
 static inline void afs_extract_discard(struct afs_call *call, size_t size)
 {
+	call->iov_len = size;
 	iov_iter_discard(&call->def_iter, READ, size);
 }
 
 static inline void afs_extract_to_buf(struct afs_call *call, size_t size)
 {
+	call->iov_len = size;
 	afs_extract_begin(call, call->buffer, size);
 }
 
diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 8be709cb8542..0ec38b758f29 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -363,6 +363,7 @@ void afs_make_call(struct afs_addr_cursor *ac, struct afs_call *call, gfp_t gfp)
 	struct rxrpc_call *rxcall;
 	struct msghdr msg;
 	struct kvec iov[1];
+	size_t len;
 	s64 tx_total_len;
 	int ret;
 
@@ -466,9 +467,10 @@ void afs_make_call(struct afs_addr_cursor *ac, struct afs_call *call, gfp_t gfp)
 		rxrpc_kernel_abort_call(call->net->socket, rxcall,
 					RX_USER_ABORT, ret, "KSD");
 	} else {
+		len = 0;
 		iov_iter_kvec(&msg.msg_iter, READ, NULL, 0, 0);
 		rxrpc_kernel_recv_data(call->net->socket, rxcall,
-				       &msg.msg_iter, false,
+				       &msg.msg_iter, &len, false,
 				       &call->abort_code, &call->service_id);
 		ac->abort_code = call->abort_code;
 		ac->responded = true;
@@ -504,6 +506,7 @@ void afs_make_call(struct afs_addr_cursor *ac, struct afs_call *call, gfp_t gfp)
 static void afs_deliver_to_call(struct afs_call *call)
 {
 	enum afs_call_state state;
+	size_t len;
 	u32 abort_code, remote_abort = 0;
 	int ret;
 
@@ -516,10 +519,11 @@ static void afs_deliver_to_call(struct afs_call *call)
 	       state == AFS_CALL_SV_AWAIT_ACK
 	       ) {
 		if (state == AFS_CALL_SV_AWAIT_ACK) {
+			len = 0;
 			iov_iter_kvec(&call->def_iter, READ, NULL, 0, 0);
 			ret = rxrpc_kernel_recv_data(call->net->socket,
 						     call->rxcall, &call->def_iter,
-						     false, &remote_abort,
+						     &len, false, &remote_abort,
 						     &call->service_id);
 			trace_afs_receive_data(call, &call->def_iter, false, ret);
 
@@ -929,10 +933,11 @@ int afs_extract_data(struct afs_call *call, bool want_more)
 	u32 remote_abort = 0;
 	int ret;
 
-	_enter("{%s,%zu},%d", call->type->name, iov_iter_count(iter), want_more);
+	_enter("{%s,%zu,%zu},%d",
+	       call->type->name, call->iov_len, iov_iter_count(iter), want_more);
 
 	ret = rxrpc_kernel_recv_data(net->socket, call->rxcall, iter,
-				     want_more, &remote_abort,
+				     &call->iov_len, want_more, &remote_abort,
 				     &call->service_id);
 	if (ret == 0 || ret == -EAGAIN)
 		return ret;
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index bd787e71a657..6c45d32da13c 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -363,8 +363,9 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 	unsigned int size;
 	int ret;
 
-	_enter("{%u,%zu/%llu}",
-	       call->unmarshall, iov_iter_count(call->iter), req->actual_len);
+	_enter("{%u,%zu, %zu/%llu}",
+	       call->unmarshall, call->iov_len, iov_iter_count(call->iter),
+	       req->actual_len);
 
 	switch (call->unmarshall) {
 	case 0:
@@ -396,6 +397,7 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 			size = PAGE_SIZE - req->offset;
 		else
 			size = req->remain;
+		call->iov_len = size;
 		call->bvec[0].bv_len = size;
 		call->bvec[0].bv_offset = req->offset;
 		call->bvec[0].bv_page = req->pages[req->index];
diff --git a/include/net/af_rxrpc.h b/include/net/af_rxrpc.h
index f6abcc0bbd6e..cee5f83c0f11 100644
--- a/include/net/af_rxrpc.h
+++ b/include/net/af_rxrpc.h
@@ -53,7 +53,7 @@ int rxrpc_kernel_send_data(struct socket *, struct rxrpc_call *,
 			   struct msghdr *, size_t,
 			   rxrpc_notify_end_tx_t);
 int rxrpc_kernel_recv_data(struct socket *, struct rxrpc_call *,
-			   struct iov_iter *, bool, u32 *, u16 *);
+			   struct iov_iter *, size_t *, bool, u32 *, u16 *);
 bool rxrpc_kernel_abort_call(struct socket *, struct rxrpc_call *,
 			     u32, int, const char *);
 void rxrpc_kernel_end_call(struct socket *, struct rxrpc_call *);
diff --git a/net/rxrpc/recvmsg.c b/net/rxrpc/recvmsg.c
index fef3573fdc8b..eca6dda26c77 100644
--- a/net/rxrpc/recvmsg.c
+++ b/net/rxrpc/recvmsg.c
@@ -669,6 +669,7 @@ int rxrpc_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
  * @sock: The socket that the call exists on
  * @call: The call to send data through
  * @iter: The buffer to receive into
+ * @_len: The amount of data we want to receive (decreased on return)
  * @want_more: True if more data is expected to be read
  * @_abort: Where the abort code is stored if -ECONNABORTED is returned
  * @_service: Where to store the actual service ID (may be upgraded)
@@ -684,7 +685,7 @@ int rxrpc_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
  * *_abort should also be initialised to 0.
  */
 int rxrpc_kernel_recv_data(struct socket *sock, struct rxrpc_call *call,
-			   struct iov_iter *iter,
+			   struct iov_iter *iter, size_t *_len,
 			   bool want_more, u32 *_abort, u16 *_service)
 {
 	size_t offset = 0;
@@ -692,7 +693,7 @@ int rxrpc_kernel_recv_data(struct socket *sock, struct rxrpc_call *call,
 
 	_enter("{%d,%s},%zu,%d",
 	       call->debug_id, rxrpc_call_states[call->state],
-	       iov_iter_count(iter), want_more);
+	       *_len, want_more);
 
 	ASSERTCMP(call->state, !=, RXRPC_CALL_SERVER_SECURING);
 
@@ -703,8 +704,8 @@ int rxrpc_kernel_recv_data(struct socket *sock, struct rxrpc_call *call,
 	case RXRPC_CALL_SERVER_RECV_REQUEST:
 	case RXRPC_CALL_SERVER_ACK_REQUEST:
 		ret = rxrpc_recvmsg_data(sock, call, NULL, iter,
-					 iov_iter_count(iter), 0,
-					 &offset);
+					 *_len, 0, &offset);
+		*_len -= offset;
 		if (ret < 0)
 			goto out;
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

