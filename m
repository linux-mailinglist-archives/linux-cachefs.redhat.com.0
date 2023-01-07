Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B8B660FD5
	for <lists+linux-cachefs@lfdr.de>; Sat,  7 Jan 2023 16:11:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673104312;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hHlTvGUcfyXBZBtaRMs2mj8eyGgKseYhBUWQ3YZeJYM=;
	b=E4nxOB7zlG+eRLzFJwVWMPscrV0wL0IOJpCuuFWsk0AE67Og+HLjjv2SLQ08UoKJ7op/wu
	prbXR9okE0iIvxb2wnfgHLJ4si4skt/JqBn7jC8ZgFDlxmnaMAGrISj12FRVUH7v/vfCZM
	xzCX8uQULwvB2hTgKb4HLfU7ksbew00=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-DZn7v2xZOoqyOpFjGY1K4A-1; Sat, 07 Jan 2023 10:11:49 -0500
X-MC-Unique: DZn7v2xZOoqyOpFjGY1K4A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C73B83806721;
	Sat,  7 Jan 2023 15:11:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F648492B00;
	Sat,  7 Jan 2023 15:11:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BD5E919459C4;
	Sat,  7 Jan 2023 15:11:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8D0B61946586 for <linux-cachefs@listman.corp.redhat.com>;
 Sat,  7 Jan 2023 15:11:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3842814152F6; Sat,  7 Jan 2023 15:11:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3016C140EBF5
 for <linux-cachefs@redhat.com>; Sat,  7 Jan 2023 15:11:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 122A01871CD5
 for <linux-cachefs@redhat.com>; Sat,  7 Jan 2023 15:11:45 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-657-fi6oy78mMuKsjA0aPQdA5g-1; Sat,
 07 Jan 2023 10:11:41 -0500
X-MC-Unique: fi6oy78mMuKsjA0aPQdA5g-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pEArM-000dly-Pt; Sat, 07 Jan 2023 15:11:48 +0000
Date: Sat, 7 Jan 2023 15:11:48 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <Y7mLtPpRz8boODVX@casper.infradead.org>
References: <167172131368.2334525.8569808925687731937.stgit@warthog.procyon.org.uk>
 <167172132272.2334525.13617516784050484518.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <167172132272.2334525.13617516784050484518.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v5 1/3] mm: Merge
 folio_has_private()/filemap_release_folio() call pairs
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
Cc: Dominique Martinet <asmadeus@codewreck.org>, linux-mm@kvack.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-afs@lists.infradead.org,
 Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 linux-cachefs@redhat.com, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Rohith Surabattula <rohiths.msft@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, linux-ext4@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 03:02:02PM +0000, David Howells wrote:
> Make filemap_release_folio() check folio_has_private().  Then, in most
> cases, where a call to folio_has_private() is immediately followed by a
> call to filemap_release_folio(), we can get rid of the test in the pair.
> 
> The same is done to page_has_private()/try_to_release_page() call pairs.

This line is now obsolete.

> There are a couple of sites in mm/vscan.c that this can't so easily be
> done.  In shrink_folio_list(), there are actually three cases (something
> different is done for incompletely invalidated buffers), but
> filemap_release_folio() elides two of them.
> 
> In shrink_active_list(), we don't have have the folio lock yet, so the
> check allows us to avoid locking the page unnecessarily.
> 
> A wrapper function to check if a folio needs release is provided for those
> places that still need to do it in the mm/ directory.  This will acquire
> additional parts to the condition in a future patch.
> 
> After this, the only remaining caller of folio_has_private() outside of mm/
> is a check in fuse.

But there are a few remaining places which check page_has_private().
I think they're all wrong and should be PagePrivate(), but I'll look
at them more next week.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

