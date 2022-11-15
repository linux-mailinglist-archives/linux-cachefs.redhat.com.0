Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0797A628FFE
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Nov 2022 03:35:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668479714;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H+LpuetP7teYzIFoUPCF17MHUpHFxbde6wqrh8SXn68=;
	b=TYJ1nNYzVgpLnA90pu5BQwOmJ/OqSCdAEnp7KtOzWtp2h4rivOtmU0pk5u+rD0KMylaKGc
	IAKmwQtrQk4j+5H5wdJnYcaGgBLEE+sPn0tPeoxcffXk+6i9R97DibAktZeFHcOlhjmmzP
	ihWS8pSx/b+l4IzrueGz30mM7bBM0Pc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-ips8hHz0PyqS148D3kPK4Q-1; Mon, 14 Nov 2022 21:35:11 -0500
X-MC-Unique: ips8hHz0PyqS148D3kPK4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E70C129AB3F5;
	Tue, 15 Nov 2022 02:35:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B20E2028CE4;
	Tue, 15 Nov 2022 02:35:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EBA2319465B2;
	Tue, 15 Nov 2022 02:35:07 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0961B1946589 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 15 Nov 2022 02:35:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7F8D2C19145; Tue, 15 Nov 2022 02:35:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7863EC1912A
 for <linux-cachefs@redhat.com>; Tue, 15 Nov 2022 02:35:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59923811E7A
 for <linux-cachefs@redhat.com>; Tue, 15 Nov 2022 02:35:03 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-0EyerDF7M4GJxj_QEIsJYw-1; Mon, 14 Nov 2022 21:34:56 -0500
X-MC-Unique: 0EyerDF7M4GJxj_QEIsJYw-1
Received: by nautica.notk.org (Postfix, from userid 108)
 id 84FD8C009; Tue, 15 Nov 2022 03:35:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on nautica.notk.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
 autolearn=unavailable version=3.3.2
Received: from odin.codewreck.org (localhost [127.0.0.1])
 by nautica.notk.org (Postfix) with ESMTPS id D917EC009;
 Tue, 15 Nov 2022 03:34:54 +0100 (CET)
Received: from localhost (odin.codewreck.org [local])
 by odin.codewreck.org (OpenSMTPD) with ESMTPA id ea3428a8;
 Tue, 15 Nov 2022 02:34:46 +0000 (UTC)
Date: Tue, 15 Nov 2022 11:34:31 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <Y3L6t0U89o27gJru@codewreck.org>
References: <Y3Lbul7FZncNVwVZ@codewreck.org>
 <166844174069.1124521.10890506360974169994.stgit@warthog.procyon.org.uk>
 <1457985.1668472862@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1457985.1668472862@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Linux-cachefs] [RFC PATCH v2] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, willy@infradead.org,
 Steve French <sfrench@samba.org>, linux-mm@kvack.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells wrote on Tue, Nov 15, 2022 at 12:41:02AM +0000:
> Dominique Martinet <asmadeus@codewreck.org> wrote:
> > any harm in setting this if netfs isn't enabled?
> > (just asking because you checked in fs/9p/cache.c above)
> 
> Well, it forces a call to ->release_folio() every time a folio is released, if
> set, rather than just if PG_private/PG_private_2 is set.

Yes, that's what I gathered from your explanation, but I don't
understand what release_folio() actually implies in practice which is
why I asked -- it looked a bit odd that you're checking for
v9inode->netfs.cache in one case and not in the other; especially as all
inodes should go through both v9fs_cache_inode_get_cookie() (when
created) and v9fs_evict_inode() so I was a bit curious.

In the 9p-without-cache case, we're normally not going through page
cache at all, so I guess there won't be any mapping and this will be
free anyway...

> > > -	if (folio_has_private(folio) && !filemap_release_folio(folio, 0))
> > > +	if (!filemap_release_folio(folio, 0))
> > 
> > should this (and all others) check for folio_needs_release instead of has_private?
> > filemap_release_folio doesn't check as far as I can see, but perhaps
> > it's already fast and noop for another reason I didn't see.
> 
> Willy suggested merging the checks from folio_has_private() into
> filemap_release_folio():
> 
> 	https://lore.kernel.org/r/Yk9V/03wgdYi65Lb@casper.infradead.org/

Ah, I didn't understand the suggestion in your patch was a separate
patch and didn't follow the link.
It doesn't look like a patch per se, perhaps sending both together would
make sense -- but on top of this change these should indeed be fine,
thanks.

--
Dominique

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

