Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DD92E346D0A
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 23:30:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616538612;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HRscKi7MI/1p7oZIXpWTS3SlssrCDJ4dt52mM39GU1I=;
	b=FgWAQeMfh/kgPvs427EWtYYrgw5rdnTay22ubaRSK2huSZNZG3QvWlV/dfjbRdMHM+bEU3
	ExGYeqlBzNWYit8CcJ5M2LE1ZHj6k1T1HOmXyk3HkELun9mksv9zJZxo+gPQDQj/jTnsCO
	nh/T/Efh73N8iJcpOBLeXNODh/xEwMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-LSwnhtpkMGeq0YsI5w8ODA-1; Tue, 23 Mar 2021 18:30:10 -0400
X-MC-Unique: LSwnhtpkMGeq0YsI5w8ODA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8874987A83F;
	Tue, 23 Mar 2021 22:30:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BA75610AF;
	Tue, 23 Mar 2021 22:30:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E50E180C5AA;
	Tue, 23 Mar 2021 22:30:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NEGaPX010193 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 10:16:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0A52710023AF; Tue, 23 Mar 2021 14:16:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E189C10016FD;
	Tue, 23 Mar 2021 14:16:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210323135116.GF1719932@casper.infradead.org>
References: <20210323135116.GF1719932@casper.infradead.org>
	<1885296.1616410586@warthog.procyon.org.uk>
	<20210321105309.GG3420@casper.infradead.org>
	<161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
	<161539528910.286939.1252328699383291173.stgit@warthog.procyon.org.uk>
	<2499407.1616505440@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Tue, 23 Mar 2021 14:16:28 +0000
Message-ID: <2503810.1616508988@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Mar 2021 18:29:55 -0400
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 02/28] mm: Add an unlock function for
	PG_private_2/PG_fscache
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
Content-ID: <2503809.1616508988.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> On Tue, Mar 23, 2021 at 01:17:20PM +0000, David Howells wrote:
> > +++ b/fs/afs/write.c
> > @@ -846,7 +846,7 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
> >  	 */
> >  #ifdef CONFIG_AFS_FSCACHE
> >  	if (PageFsCache(page) &&
> > -	    wait_on_page_bit_killable(page, PG_fscache) < 0)
> > +	    wait_on_page_fscache_killable(page) < 0)
> >  		return VM_FAULT_RETRY;
> >  #endif
> >  
> > @@ -861,7 +861,8 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
> >  	 * details the portion of the page we need to write back and we might
> >  	 * need to redirty the page if there's a problem.
> >  	 */
> > -	wait_on_page_writeback(page);
> > +	if (wait_on_page_writeback_killable(page) < 0)
> > +		return VM_FAULT_RETRY | VM_FAULT_LOCKED;
> 
> You forgot to unlock the page.

Do I need to?  Doesn't VM_FAULT_LOCKED indicate that to the caller?  Or is it
impermissible to do it like that?

> Also, if you're waiting killably here, do you need to wait before you get
> the page lock?  Ditto for waiting on fscache -- do you want to do that
> before or after you get the page lock?

I'm waiting both before and after.  If I wait before, write() can go and
trample over the page between PG_writeback/PG_fscache being cleared and us
getting the lock here.  Probably I should only be waiting after locking the
page.

> Also, I never quite understood why you needed to wait for fscache
> writes to finish before allowing the page to be dirtied.  Is this a
> wait_for_stable_page() kind of situation, where the cache might be
> calculating a checksum on it?  Because as far as I can tell, once the
> page is dirty in RAM, the contents of the on-disk cache are irrelevant ...
> unless they're part of a RAID 5 checksum kind of situation.

Um.  I do want to add disconnected operation in the future and cache
encryption, but, as things currently stand, it isn't necessary because the
cache object is marked "in use" and will be discarded on rebinding after a
power loss or crash if it's still marked when it's opened again.

Also, the thought has occurred to me that I can make use of reflink copy to
handle the caching of local modifications to cached files, in which case I'd
rather have a clean copy to link from.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

