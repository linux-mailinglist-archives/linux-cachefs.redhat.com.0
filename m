Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D643446ED87
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 17:50:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639068630;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iDdLARm3uuZ4k1bUtgKLDoyt1pRaEigpaa3n6uVXgjU=;
	b=NfrgOdXYXN2qcF5e2VlmKkYEoMEaZRBT5oBowh0znw+7UrTTIEhJb+e6U+9D90gRtXkVnc
	8rw2RaxPMKelRWrhJejRygQz6tL/GTJOBfTfiIDfZ3zUGhMsUghV2T0A5cWQ16MPAnO31H
	Fta1rwYHzyBsW6kRqtZlcwQKzjFeRME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-6fsR4gYYN9iWk2OfbmcR6w-1; Thu, 09 Dec 2021 11:50:27 -0500
X-MC-Unique: 6fsR4gYYN9iWk2OfbmcR6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C196104FC0D;
	Thu,  9 Dec 2021 16:50:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E64481000180;
	Thu,  9 Dec 2021 16:50:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A38C31809CB8;
	Thu,  9 Dec 2021 16:50:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9GoJdF018131 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 11:50:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 78BE05ED40; Thu,  9 Dec 2021 16:50:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24DE25ED39;
	Thu,  9 Dec 2021 16:49:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <d4167c15-b3ce-73b2-1d66-97d651723305@linux.alibaba.com>
References: <d4167c15-b3ce-73b2-1d66-97d651723305@linux.alibaba.com>
	<163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
	<163819612321.215744.9738308885948264476.stgit@warthog.procyon.org.uk>
To: JeffleXu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Thu, 09 Dec 2021 16:49:53 +0000
Message-ID: <143692.1639068593@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1B9GoJdF018131
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 24/64] netfs: Pass more information on
	how to deal with a hole in the cache
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <143691.1639068593.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

JeffleXu <jefflexu@linux.alibaba.com> wrote:

> > @@ -466,7 +466,7 @@ static void netfs_rreq_short_read(struct netfs_read_request *rreq,
> >  	netfs_get_read_subrequest(subreq);
> >  	atomic_inc(&rreq->nr_rd_ops);
> >  	if (subreq->source == NETFS_READ_FROM_CACHE)
> > -		netfs_read_from_cache(rreq, subreq, true);
> > +		netfs_read_from_cache(rreq, subreq, NETFS_READ_HOLE_CLEAR);
> 
> Hi I'm not sure why NETFS_READ_HOLE_CLEAR style should be used in 'short
> read' case.

The cache backing filesystem (eg. ext4) might have excised a chunk of zeros
from the cache in order to optimise its extent list.  This instructs the cache
to zero over the cracks.  Actually, I need to think a bit further on this.
This was written assuming that the cache tracks its content independently -
but those patches are not in with this set.

> I'm not sure why 'subreq->start' is not incremented with
> 'subreq->transferred' when calling cres->ops->read() in 'short read' case.

subreq->start shouldn't get changed.  subreq->transferred is sufficient.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

