Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F3665589F
	for <lists+linux-cachefs@lfdr.de>; Sat, 24 Dec 2022 07:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671863005;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fbyQQ1/glGVz6rOMvX+v0Bn8Uc8PaHGaTilnkIriiY8=;
	b=gZzvCl5xBSvnIKOKCOl93CpHAJG0QCDKZGY/OeIZYe0BgdMlIdgStB5XoQNxuYKCNRJ8EQ
	MMfvcM9W403WubdKsyFLJ7YizJDJuRSwdB9Wx/VmBBazCfzWVJX/GDn/B5Y9vLERnkDinG
	ukPMalmOm7cl2ljdv1XCnij+yvh8XF8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-ybS4ob6oMEG7Xdjki1BdsQ-1; Sat, 24 Dec 2022 01:23:21 -0500
X-MC-Unique: ybS4ob6oMEG7Xdjki1BdsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CA378533AC;
	Sat, 24 Dec 2022 06:23:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BEE1340C1073;
	Sat, 24 Dec 2022 06:23:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4E6CC19465B1;
	Sat, 24 Dec 2022 06:23:19 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3136C1946588 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 24 Dec 2022 06:23:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DDEF314152F4; Sat, 24 Dec 2022 06:23:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D67661410DD7
 for <linux-cachefs@redhat.com>; Sat, 24 Dec 2022 06:23:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B93DA3806710
 for <linux-cachefs@redhat.com>; Sat, 24 Dec 2022 06:23:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-OyMWkYhMMDiSHST1u-pBDA-1; Sat, 24 Dec 2022 01:23:10 -0500
X-MC-Unique: OyMWkYhMMDiSHST1u-pBDA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p8k0x-009SnO-0o; Fri, 23 Dec 2022 15:31:15 +0000
Date: Fri, 23 Dec 2022 07:31:14 -0800
From: Christoph Hellwig <hch@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <Y6XJwvjKyTgRIiI3@infradead.org>
References: <167172131368.2334525.8569808925687731937.stgit@warthog.procyon.org.uk>
 <167172134962.2334525.570622889806603086.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <167172134962.2334525.570622889806603086.stgit@warthog.procyon.org.uk>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v5 3/3] mm: Make filemap_release_folio()
 better inform shrink_folio_list()
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
 Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
 linux-mm@kvack.org, linux-erofs@lists.ozlabs.org, linux-cachefs@redhat.com,
 linux-ext4@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dominique Martinet <asmadeus@codewreck.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 03:02:29PM +0000, David Howells wrote:
> Make filemap_release_folio() return one of three values:
> 
>  (0) FILEMAP_CANT_RELEASE_FOLIO
> 
>      Couldn't release the folio's private data, so the folio can't itself
>      be released.
> 
>  (1) FILEMAP_RELEASED_FOLIO
> 
>      The private data on the folio was released and the folio can be
>      released.
> 
>  (2) FILEMAP_FOLIO_HAD_NO_PRIVATE

These names read really odd, due to the different placementments
of FOLIO, the present vs past tense and the fact that 2 also released
the folio, and the reliance of callers that one value of an enum
must be 0, while no unprecedented, is a bit ugly.

But do we even need them?  What abut just open coding
filemap_release_folio (which is a mostly trivial function) in
shrink_folio_list, which is the only place that cares?

	if (folio_has_private(folio) && folio_needs_release(folio)) {
		if (folio_test_writeback(folio))
			goto activate_locked;

		if (mapping && mapping->a_ops->release_folio) {
			if (!mapping->a_ops->release_folio(folio, gfp))
				goto activate_locked;
		} else {
			if (!try_to_free_buffers(folio))
				goto activate_locked;
		}

		if (!mapping && folio_ref_count(folio) == 1) {
			...

alternatively just keep using filemap_release_folio and just add the
folio_needs_release in the first branch.  That duplicates the test,
but makes the change a one-liner.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

