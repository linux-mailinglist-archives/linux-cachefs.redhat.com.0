Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 76D4A2250FD
	for <lists+linux-cachefs@lfdr.de>; Sun, 19 Jul 2020 11:53:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595152393;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P2ePNZIUETt9pS6mf3Z8HJhO2gLlZPsmP9iuPSyeM2I=;
	b=aU5wFxU0SlQkssMGJzmgWJbqriD0yfv+Xw65zMn9OdksdpAf5X+utAwl8ZJ4ZE0t1URtiN
	WGpBUpQF5YAYVUHBcGekdR5AqvlZB02yYtBb++X9tBMHtSLThCMx0W0iZ6kgOBK2DXhadT
	gRV1xk9/eQ/xgq0hD41KfIupHMXmdPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-_gfEJI-GNLm2dSID8SVm5A-1; Sun, 19 Jul 2020 05:53:11 -0400
X-MC-Unique: _gfEJI-GNLm2dSID8SVm5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C55B18A1DE5;
	Sun, 19 Jul 2020 09:53:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E17291001901;
	Sun, 19 Jul 2020 09:53:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 508299A126;
	Sun, 19 Jul 2020 09:53:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06J9pwhu012875 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 19 Jul 2020 05:51:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 922EF2B6D4; Sun, 19 Jul 2020 09:51:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-32.rdu2.redhat.com
	[10.10.112.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F9481A90F;
	Sun, 19 Jul 2020 09:51:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20200719014436.GG2786714@ZenIV.linux.org.uk>
References: <20200719014436.GG2786714@ZenIV.linux.org.uk>
	<159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk>
	<159465785214.1376674.6062549291411362531.stgit@warthog.procyon.org.uk>
To: Al Viro <viro@zeniv.linux.org.uk>
From: David Howells <dhowells@redhat.com>
MIME-Version: 1.0
Content-ID: <3417.1595152311.1@warthog.procyon.org.uk>
Date: Sun, 19 Jul 2020 10:51:51 +0100
Message-ID: <3418.1595152311@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 01/32] iov_iter: Add ITER_MAPPING
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Al Viro <viro@zeniv.linux.org.uk> wrote:

> My main problem here is that your iterate_mapping() assumes that STEP is
> safe under rcu_read_lock(), with no visible mentioning of that fact.

Yeah, that's probably the biggest objection to this.

> Note, BTW, that iov_iter_for_each_range() quietly calls user-supplied
> callback in such context.

And calls kmap(), but should probably use kmap_atomic().  git grep doesn't
show any users of this, so can it be removed?

> Incidentally, do you ever have different steps for bvec and mapping?

Yes:

	csum_and_copy_from_iter_full()
	iov_iter_npages()
	iov_iter_get_pages()
	iov_iter_get_pages_alloc()

But I've tried to use the internal representation struct for bvec where I can
rather than inventing a new one.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

