Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED9236A9DD
	for <lists+linux-cachefs@lfdr.de>; Mon, 26 Apr 2021 01:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619393160;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Px6wzBHhslcrXe55JjZCgHhTQXUpcO5up2IDmhAKtRY=;
	b=iypt3ZuukISNMBQuZNpKriX4soCSZTN/mTvbCC1rtdFyRjerGuCXaPUmein5GkonTii10U
	plXIJPFy3krjS+xa7v+yqluvmD9/lIYVE66STF1ScOO0FUaZdHB8rSSnJc1s7HLYDs3yYF
	BebRPCcdrGZvHoRYiZ4a5Bki7FaHwTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-bdO9EY0mM0WB8YvKOi2DAQ-1; Sun, 25 Apr 2021 19:25:58 -0400
X-MC-Unique: bdO9EY0mM0WB8YvKOi2DAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9762C343A8;
	Sun, 25 Apr 2021 23:25:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DAF34278;
	Sun, 25 Apr 2021 23:25:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DA631809C82;
	Sun, 25 Apr 2021 23:25:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13PNExTu003985 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 25 Apr 2021 19:14:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F3BC261F5E; Sun, 25 Apr 2021 23:14:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-124.rdu2.redhat.com
	[10.10.112.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C7785D74F;
	Sun, 25 Apr 2021 23:14:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
References: <161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
	<161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
To: Alexander Viro <viro@zeniv.linux.org.uk>
MIME-Version: 1.0
Date: Mon, 26 Apr 2021 00:14:50 +0100
Message-ID: <3545034.1619392490@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13PNExTu003985
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Sun, 25 Apr 2021 19:25:51 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	Steve French <sfrench@samba.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Dominique Martinet <asmadeus@codewreck.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [Linux-cachefs] [PATCH] iov_iter: Four fixes for ITER_XARRAY
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3545033.1619392490.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Al,

I think this patch should include all the fixes necessary.  I could merge
it in, but I think it might be better to tag it on the end as an additional
patch.

David
---
iov_iter: Four fixes for ITER_XARRAY

Fix four things[1] in the patch that adds ITER_XARRAY[2]:

 (1) Remove the address_space struct predeclaration.  This is a holdover
     from when it was ITER_MAPPING.

 (2) Fix _copy_mc_to_iter() so that the xarray segment updates count and
     iov_offset in the iterator before returning.

 (3) Fix iov_iter_alignment() to not loop in the xarray case.  Because the
     middle pages are all whole pages, only the end pages need be
     considered - and this can be reduced to just looking at the start
     position in the xarray and the iteration size.

 (4) Fix iov_iter_advance() to limit the size of the advance to no more
     than the remaining iteration size.

Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: David Howells <dhowells@redhat.com>
Link: https://lore.kernel.org/r/YIVrJT8GwLI0Wlgx@zeniv-ca.linux.org.uk [1]
Link: https://lore.kernel.org/r/161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk [2]
---
 include/linux/uio.h |    1 -
 lib/iov_iter.c      |    5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/uio.h b/include/linux/uio.h
index 5f5ffc45d4aa..d3ec87706d75 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -10,7 +10,6 @@
 #include <uapi/linux/uio.h>
 
 struct page;
-struct address_space;
 struct pipe_inode_info;
 
 struct kvec {
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 44fa726a8323..61228a6c69f8 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -791,6 +791,8 @@ size_t _copy_mc_to_iter(const void *addr, size_t bytes, struct iov_iter *i)
 			curr_addr = (unsigned long) from;
 			bytes = curr_addr - s_addr - rem;
 			rcu_read_unlock();
+			i->iov_offset += bytes;
+			i->count -= bytes;
 			return bytes;
 		}
 		})
@@ -1147,6 +1149,7 @@ void iov_iter_advance(struct iov_iter *i, size_t size)
 		return;
 	}
 	if (unlikely(iov_iter_is_xarray(i))) {
+		size = min(size, i->count);
 		i->iov_offset += size;
 		i->count -= size;
 		return;
@@ -1346,6 +1349,8 @@ unsigned long iov_iter_alignment(const struct iov_iter *i)
 			return size | i->iov_offset;
 		return size;
 	}
+	if (unlikely(iov_iter_is_xarray(i)))
+		return (i->xarray_start + i->iov_offset) | i->count;
 	iterate_all_kinds(i, size, v,
 		(res |= (unsigned long)v.iov_base | v.iov_len, 0),
 		res |= v.bv_offset | v.bv_len,

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

