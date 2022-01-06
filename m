Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 913E948679B
	for <lists+linux-cachefs@lfdr.de>; Thu,  6 Jan 2022 17:27:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641486431;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tXOuO4ihigM2GU7zBqm36Dff4G/7OyrvXSkG/HLz7TM=;
	b=O4ROoiOePtCUItOmuZQ6ixT/0ukEpedbP2mx+hNuLPar+T1ry5HF7RqTpjgoTnllvV+cI6
	cpU3Ku69N8LZLAY4rrhL9HI+mBlM2SYtAM0rC8Z+M6WruDUPcSBzOsh2dW+p/Y/YcoUs9m
	d3yM505DXwWjxXrSlQ3ch6+CqJxrjkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-hdSvuaD3Nz2a2N6ljs_DYg-1; Thu, 06 Jan 2022 11:27:08 -0500
X-MC-Unique: hdSvuaD3Nz2a2N6ljs_DYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5737910247BD;
	Thu,  6 Jan 2022 16:27:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4D672B5A3;
	Thu,  6 Jan 2022 16:27:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58A641809CB8;
	Thu,  6 Jan 2022 16:27:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 206GR1Lb004401 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 6 Jan 2022 11:27:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CD8E07E671; Thu,  6 Jan 2022 16:27:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26CED70D3D;
	Thu,  6 Jan 2022 16:26:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <043a206f03929c2667a465314144e518070a9b2d.camel@kernel.org>
References: <043a206f03929c2667a465314144e518070a9b2d.camel@kernel.org>
	<164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
	<164021525963.640689.9264556596205140044.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Thu, 06 Jan 2022 16:26:57 +0000
Message-ID: <2848131.1641486417@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 206GR1Lb004401
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 28/68] fscache: Provide a function to
	note the release of a page
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
Content-ID: <2848130.1641486417.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> > +/**
> > + * fscache_note_page_release - Note that a netfs page got released
> > + * @cookie: The cookie corresponding to the file
> > + *
> > + * Note that a page that has been copied to the cache has been released.  This
> > + * means that future reads will need to look in the cache to see if it's there.
> > + */
> > +static inline
> > +void fscache_note_page_release(struct fscache_cookie *cookie)
> > +{
> > +	if (cookie &&
> > +	    test_bit(FSCACHE_COOKIE_HAVE_DATA, &cookie->flags) &&
> > +	    test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags))
> > +		clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
> > +}
> > +
> >  #endif /* _LINUX_FSCACHE_H */
> > 
> > 
> 
> Is this logic correct?
> 
> FSCACHE_COOKIE_HAVE_DATA gets set in cachefiles_write_complete, but will
> that ever be called on a cookie that has no data? Will we ever call
> cachefiles_write at all when there is no data to be written?

FSCACHE_COOKIE_NO_DATA_TO_READ is set if we have no data in the cache yet
(ie. the backing file lookup was negative, the file is 0 length or the cookie
got invalidated).  It means that we have no data in the cache, not that the
file is necessarily empty on the server.

FSCACHE_COOKIE_HAVE_DATA is set once we've stored data in the backing file.
>From that point on, we have data we *could* read - however, it's covered by
pages in the netfs pagecache until at such time one of those covering pages is
released.

So if we've written data to the cache (HAVE_DATA) and there wasn't any data in
the cache when we started (NO_DATA_TO_READ), it may no longer be true that we
can skip reading from the cache.

Read skipping is done by cachefiles_prepare_read().

Note that I'm not doing tracking on a per-page basis, but only on a per-file
basis.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

