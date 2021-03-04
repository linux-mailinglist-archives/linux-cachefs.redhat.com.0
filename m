Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C42FE32D470
	for <lists+linux-cachefs@lfdr.de>; Thu,  4 Mar 2021 14:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614865644;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cVJC1TmVItDUfg/4haPZr2vNuXKGCXvlm8TM0O7Mx0Q=;
	b=EUuJRjTD1FeezOdfmOMcBRaOCzQc+nag+wHyy6kcuVyGo5BB9q4QDjDb7Himv+uKtQNCC2
	OiYq5MZCg0n5IUzESooDsde/GMqu5l3DoUntrwpqFyCDOkGCNjvZWERhwlwH6Tv3EEPfWs
	miDt6EBelx7JjdZoHFCafwRndSlBZ/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-Ot5_s44fN52IFUEa-NwhbA-1; Thu, 04 Mar 2021 08:47:23 -0500
X-MC-Unique: Ot5_s44fN52IFUEa-NwhbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA588EC1A5;
	Thu,  4 Mar 2021 13:47:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24BC660CCB;
	Thu,  4 Mar 2021 13:47:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4EB04A714;
	Thu,  4 Mar 2021 13:47:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 124DlBiD005424 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 4 Mar 2021 08:47:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7610F58821; Thu,  4 Mar 2021 13:47:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-66.rdu2.redhat.com
	[10.10.112.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D08AD5C1A1;
	Thu,  4 Mar 2021 13:47:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2653261.1614813611@warthog.procyon.org.uk>
References: <2653261.1614813611@warthog.procyon.org.uk>
To: linux-cachefs@redhat.com
MIME-Version: 1.0
Date: Thu, 04 Mar 2021 13:47:04 +0000
Message-ID: <2973223.1614865624@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 124DlBiD005424
X-loop: linux-cachefs@redhat.com
Cc: "J. Bruce Fields" <bfields@fieldses.org>, linux-nfs@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Dave Chinner <dchinner@redhat.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] fscache: Redesigning the on-disk cache - LRU
	handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2973222.1614865624.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> wrote:

> 
>  (3) OpenAFS-style format.  One index file to look up {file_key,block#} and an
>      array of data files, each holding one block (e.g. a 256KiB-aligned chunk
>      of a file).  Each index entry has valid start/end offsets for easy
>      truncation.
> 
>      The index has a hash to facilitate the lookup and an LRU that allows a
>      block to be recycled at any time.

The LRU would probably have to be a doubly-linked list so that entries can be
removed from it easily.  This means typically touching two other entries,
which might not be in the same page; further, if the entry is being freed,
we'd need to excise it from the hash chain also, necessitating touching maybe
two more entries - which might also be in different pages.

Maybe the LRU idea plus a free block bitmap could be combined, however.

 (1) Say that there's a bit-pair map, with one bit pair per block.  The pair
     is set to 0 when the block is free.  When the block is accessed, the pair
     is set to 3.

 (2) When we run out of free blocks (ie. pairs that are zero), we decrement
     all the pairs and then look again.

 (3) Excision from the old hash chain would need to be done at allocation,
     though it does give a block whose usage has been reduced to 0 the chance
     to be resurrected.

Possible variations on the theme could be:

 (*) Set the pair to 2, not 3 when accessed.  Set the block to 3 to pin it;
     the process of decrementing all the pairs would leave it at 3.

 (*) Rather than decrementing all pairs at once, have a rotating window that
     does a part of the map at once.

 (*) If a round of decrementing doesn't reduce any pairs to zero, reject a
     request for space.

This would also work for a file index.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

