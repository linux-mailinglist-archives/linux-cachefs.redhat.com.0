Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AA6B13D16B0
	for <lists+linux-cachefs@lfdr.de>; Wed, 21 Jul 2021 20:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626893707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B5Uk5kujRAlykFmq9QkiO5AXPj0PNj91rZ8zqQJ7kmo=;
	b=RC1MZ3+5kVaTP7VdoDCbDMrZsg8C2QTa4W8YvBd0DLkHor/E9/s5IOpco7/G0Q5suf/4UV
	IGPh6OmVZcEBJEpTK01YGjGUsczTZ9xUCWjI69FGDiY8F3vl+y7EQT+v7OcEObS+WOLDYL
	BxsibbltGJu9g5nblgPNcuzIBgGZchU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-o_gLIFLfOryyD16MTlI0tg-1; Wed, 21 Jul 2021 14:55:06 -0400
X-MC-Unique: o_gLIFLfOryyD16MTlI0tg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F8452B6;
	Wed, 21 Jul 2021 18:55:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ACF061F21;
	Wed, 21 Jul 2021 18:55:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1B7D4BB7C;
	Wed, 21 Jul 2021 18:55:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16LIsxZD010759 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 21 Jul 2021 14:54:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 836DD61F21; Wed, 21 Jul 2021 18:54:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-62.rdu2.redhat.com
	[10.10.112.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D744F5D740;
	Wed, 21 Jul 2021 18:54:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <e7a3b850e8a42845f4e020c7642743b3dce2b9f1.camel@redhat.com>
References: <e7a3b850e8a42845f4e020c7642743b3dce2b9f1.camel@redhat.com>
	<162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk>
	<162687511125.276387.15493860267582539643.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@redhat.com>
MIME-Version: 1.0
Date: Wed, 21 Jul 2021 19:54:52 +0100
Message-ID: <298117.1626893692@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 16LIsxZD010759
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Shyam Prasad N <nspmangalore@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] [RFC PATCH 03/12] netfs: Remove
	netfs_read_subrequest::transferred
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <298116.1626893692.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@redhat.com> wrote:

> The above two deltas seem like they should have been in patch #2.

Yeah.  Looks like at least partially so.

> > @@ -635,15 +625,8 @@ void netfs_subreq_terminated(struct netfs_read_subrequest *subreq,
> >  		goto failed;
> >  	}
> >  
> > -	if (WARN(transferred_or_error > subreq->len - subreq->transferred,
> > -		 "Subreq overread: R%x[%x] %zd > %zu - %zu",
> > -		 rreq->debug_id, subreq->debug_index,
> > -		 transferred_or_error, subreq->len, subreq->transferred))
> > -		transferred_or_error = subreq->len - subreq->transferred;
> > -
> >  	subreq->error = 0;
> > -	subreq->transferred += transferred_or_error;
> > -	if (subreq->transferred < subreq->len)
> > +	if (iov_iter_count(&subreq->iter))
> >  		goto incomplete;
> >  
> 
> I must be missing it, but where does subreq->iter get advanced to the
> end of the current read? If you're getting rid of subreq->transferred
> then I think that has to happen above, no?

For afs, afs_req_issue_op() points fsreq->iter at the subrequest iterator and
calls afs_fetch_data().  Thereafter, we wend our way to
afs_deliver_fs_fetch_data() or yfs_deliver_fs_fetch_data() which set
call->iter to point to that iterator and then call afs_extract_data() which
passes it to rxrpc_kernel_recv_data(), which eventually passes it to
skb_copy_datagram_iter(), which advances the iterator.

For the cache, the subrequest iterator is passed to the cache backend by
netfs_read_from_cache().  This would be cachefiles_read() which calls
vfs_iocb_iter_read() which I thought advances the iterator (leastways,
filemap_read() keeps going until iov_iter_count() reaches 0 or some other stop
condition occurs and doesn't thereafter call iov_iter_revert()).

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

