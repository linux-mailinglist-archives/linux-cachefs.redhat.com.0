Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC09479508
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Dec 2021 20:46:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639770391;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pPNKe0+DDe64iZgefTWPS3hzgzyAwe2Bb5mCm/7qvOc=;
	b=JZEK6pi/6PLArUbS7OwBZpG0vhSbpIRZ36NxCtMRRUSHWTgzIYB4GiP3HLfHvaGL96bjYQ
	Y/cqxSWLoSjQfwbCTq8VZdE98a4eA9VSxy50cytC8hODqG6TmQSIV1zRKIb+pzTBXhCrSA
	yxLhzp4FFCMV7R/9LSTeBusCKMdEMkc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-szbXU5RuOembaYfslR_AKg-1; Fri, 17 Dec 2021 14:46:27 -0500
X-MC-Unique: szbXU5RuOembaYfslR_AKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E99D1023F50;
	Fri, 17 Dec 2021 19:46:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BF0460BF1;
	Fri, 17 Dec 2021 19:46:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF3F24BB7C;
	Fri, 17 Dec 2021 19:46:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BHJjdvL016257 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 17 Dec 2021 14:45:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0B9EB5D740; Fri, 17 Dec 2021 19:45:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 558DB5D6B1;
	Fri, 17 Dec 2021 19:45:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <71635415237b406c5fe9e568aae8dd148445a72b.camel@kernel.org>
References: <71635415237b406c5fe9e568aae8dd148445a72b.camel@kernel.org>
	<163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
	<163967105456.1823006.14730395299835841776.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Fri, 17 Dec 2021 19:45:26 +0000
Message-ID: <2038060.1639770326@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Subject: Re: [Linux-cachefs] [PATCH v3 17/68] fscache: Implement simple
	cookie state machine
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
Content-ID: <2038059.1639770326.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> > +	case FSCACHE_COOKIE_STATE_RELINQUISHING:
> > +	case FSCACHE_COOKIE_STATE_WITHDRAWING:
> > +		if (cookie->cache_priv) {
> > +			spin_unlock(&cookie->lock);
> > +			cookie->volume->cache->ops->withdraw_cookie(cookie);
> > +			spin_lock(&cookie->lock);
> > +		}
> > +
> > +		switch (state) {
> > +		case FSCACHE_COOKIE_STATE_RELINQUISHING:
> > +			fscache_see_cookie(cookie, fscache_cookie_see_relinquish);
> > +			fscache_unhash_cookie(cookie);
> > +			__fscache_set_cookie_state(cookie,
> > +						   FSCACHE_COOKIE_STATE_DROPPED);
> > +			wake = true;
> > +			goto out;
> > +		case FSCACHE_COOKIE_STATE_WITHDRAWING:
> > +			fscache_see_cookie(cookie, fscache_cookie_see_withdraw);
> > +			break;
> > +		default:
> > +			BUG();
> > +		}
> > +
> 
> Ugh, the nested switch here is a bit hard to follow. It makes it seem
> like the state could change due to the withdraw_cookie and you're
> checking it again, but it doesn't do that.
> 
> This would be clearer if you just duplicated the withdraw_cookie stanza
> for both states and moved the stuff below here to a helper or to a new
> goto block.

There are actually three states, but one's added in a later patch.  It
probably does make sense to split the RELINQ state from the other two.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

