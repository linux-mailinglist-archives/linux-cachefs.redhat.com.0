Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 39AB4345D61
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 12:54:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616500447;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=esZRo44qqVaRFaQ68/SJp2RbJ1uuJdU+9wDlogzpvas=;
	b=GAFKj/lTfnH0KvLBL81gC3egh9ha6ATv/9EdWPMs0KDEhJpFSnFGZbNmRcKdshVAIbRw4d
	PfvsiZ+H57OO6pMG5wCSuc9Q1IJNG+su5BcobiZ0oQZuFCI2ZpquG7fikzpTD470YtF7cH
	QOWwhAgFaGFUqPYLXjcjC77SLcKORBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-MNnDfmERN4W7EjR3GvBO5Q-1; Tue, 23 Mar 2021 07:54:05 -0400
X-MC-Unique: MNnDfmERN4W7EjR3GvBO5Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AC791013720;
	Tue, 23 Mar 2021 11:54:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ABEE5D9C0;
	Tue, 23 Mar 2021 11:54:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B9924BB7C;
	Tue, 23 Mar 2021 11:54:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NBs28d025442 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 07:54:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6509918B5E; Tue, 23 Mar 2021 11:54:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1ED27179B3;
	Tue, 23 Mar 2021 11:53:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com, linux-afs@lists.infradead.org
Date: Tue, 23 Mar 2021 11:53:57 +0000
Message-ID: <161650043737.2445805.16573960069907170426.stgit@warthog.procyon.org.uk>
In-Reply-To: <161650040278.2445805.7652115256944270457.stgit@warthog.procyon.org.uk>
References: <161650040278.2445805.7652115256944270457.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH 3/3] afs: Use wait_on_page_writeback_killable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Matthew Wilcox (Oracle) <willy@infradead.org>

Open-coding this function meant it missed out on the recent bugfix
for waiters being woken by a delayed wake event from a previous
instantiation of the page.

[DH: Changed the patch to use vmf->page rather than variable page which
 doesn't exist yet upstream]

Fixes: 1cf7a1518aef ("afs: Implement shared-writeable mmap")
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-afs@lists.infradead.org
cc: linux-mm@kvack.org
Link: https://lore.kernel.org/r/20210320054104.1300774-4-willy@infradead.org
---

 fs/afs/write.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index c9195fc67fd8..eb737ed63afb 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -851,8 +851,7 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
 	fscache_wait_on_page_write(vnode->cache, vmf->page);
 #endif
 
-	if (PageWriteback(vmf->page) &&
-	    wait_on_page_bit_killable(vmf->page, PG_writeback) < 0)
+	if (wait_on_page_writeback_killable(vmf->page))
 		return VM_FAULT_RETRY;
 
 	if (lock_page_killable(vmf->page) < 0)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

