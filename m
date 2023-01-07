Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF380660FDE
	for <lists+linux-cachefs@lfdr.de>; Sat,  7 Jan 2023 16:15:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673104503;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2xuhlIY6b1mhx3+waqpf9T4ge+Rt7IX5OqiGLkcVPn0=;
	b=ercXXro4nBimS3tGFTmuzOJeRK62zgAVMF0eORCCYFbl5EHSx69JiCfcnLL2GTegizK8dl
	PT6MPYdQ9SMSY57PId5FxWCOlCZdc2Hn29/gJZ69wkR52mlgS40WMPD8S1/p663GtRipq3
	VTE/BYe0xd2QCiIAAnkcbmbHmkIj7Kc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-Ghwn4ydqPNisZfslS-NUbg-1; Sat, 07 Jan 2023 10:15:02 -0500
X-MC-Unique: Ghwn4ydqPNisZfslS-NUbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89C1729A9D41;
	Sat,  7 Jan 2023 15:15:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CB1F2026D4B;
	Sat,  7 Jan 2023 15:15:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3FFDB19459C4;
	Sat,  7 Jan 2023 15:15:01 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3CF111946586 for <linux-cachefs@listman.corp.redhat.com>;
 Sat,  7 Jan 2023 15:14:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9BCDA492B01; Sat,  7 Jan 2023 15:14:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9403C492B00
 for <linux-cachefs@redhat.com>; Sat,  7 Jan 2023 15:14:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 647141C051AC
 for <linux-cachefs@redhat.com>; Sat,  7 Jan 2023 15:14:57 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-81-WG1Hr5QBP8K6611oiKS1YQ-1; Sat,
 07 Jan 2023 10:14:55 -0500
X-MC-Unique: WG1Hr5QBP8K6611oiKS1YQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pEAly-000dbw-DB; Sat, 07 Jan 2023 15:06:14 +0000
Date: Sat, 7 Jan 2023 15:06:14 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Y7mKZj/RnD2aW5jU@casper.infradead.org>
References: <167172131368.2334525.8569808925687731937.stgit@warthog.procyon.org.uk>
 <167172134962.2334525.570622889806603086.stgit@warthog.procyon.org.uk>
 <Y6XJwvjKyTgRIiI3@infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y6XJwvjKyTgRIiI3@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <sfrench@samba.org>,
 linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-afs@lists.infradead.org,
 linux-mm@kvack.org, linux-cachefs@redhat.com, linux-ext4@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dominique Martinet <asmadeus@codewreck.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 23, 2022 at 07:31:14AM -0800, Christoph Hellwig wrote:
> On Thu, Dec 22, 2022 at 03:02:29PM +0000, David Howells wrote:
> > Make filemap_release_folio() return one of three values:
> > 
> >  (0) FILEMAP_CANT_RELEASE_FOLIO
> > 
> >      Couldn't release the folio's private data, so the folio can't itself
> >      be released.
> > 
> >  (1) FILEMAP_RELEASED_FOLIO
> > 
> >      The private data on the folio was released and the folio can be
> >      released.
> > 
> >  (2) FILEMAP_FOLIO_HAD_NO_PRIVATE
> 
> These names read really odd, due to the different placementments
> of FOLIO, the present vs past tense and the fact that 2 also released
> the folio, and the reliance of callers that one value of an enum
> must be 0, while no unprecedented, is a bit ugly.

Agreed.  The thing is that it's not the filemap that's being released,
it's the folio.  So these should be:

	FOLIO_RELEASE_SUCCESS
	FOLIO_RELEASE_FAILED
	FOLIO_RELEASE_NO_PRIVATE

... but of course, NO_PRIVATE is also a success.  So it's a really weird
thing to be reporting.  I'm with you on the latter half of this email:

> But do we even need them?  What abut just open coding
> filemap_release_folio (which is a mostly trivial function) in
> shrink_folio_list, which is the only place that cares?
> 
> 	if (folio_has_private(folio) && folio_needs_release(folio)) {
> 		if (folio_test_writeback(folio))
> 			goto activate_locked;
> 
> 		if (mapping && mapping->a_ops->release_folio) {
> 			if (!mapping->a_ops->release_folio(folio, gfp))
> 				goto activate_locked;
> 		} else {
> 			if (!try_to_free_buffers(folio))
> 				goto activate_locked;
> 		}
> 
> 		if (!mapping && folio_ref_count(folio) == 1) {
> 			...
> 
> alternatively just keep using filemap_release_folio and just add the
> folio_needs_release in the first branch.  That duplicates the test,
> but makes the change a one-liner.

Or just drop patch 3 entirely?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

