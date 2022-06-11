Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B9F5475E2
	for <lists+linux-cachefs@lfdr.de>; Sat, 11 Jun 2022 17:01:44 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-dNQJURj9MNGR7FUthSmbGw-1; Sat, 11 Jun 2022 11:01:41 -0400
X-MC-Unique: dNQJURj9MNGR7FUthSmbGw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 503AE85A581;
	Sat, 11 Jun 2022 15:01:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 570AC492C3B;
	Sat, 11 Jun 2022 15:01:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 12DD4194705B;
	Sat, 11 Jun 2022 15:01:39 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5058F1947054 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 11 Jun 2022 15:01:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 43FE118EA4; Sat, 11 Jun 2022 15:01:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 406A11131A
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 15:01:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22CA23C19029
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 15:01:38 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
 [142.44.231.140]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-3YNYRF7INLC1jN3jrvp4Kg-1; Sat, 11 Jun 2022 11:01:36 -0400
X-MC-Unique: 3YNYRF7INLC1jN3jrvp4Kg-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o02c0-0068m3-Ma; Sat, 11 Jun 2022 15:01:16 +0000
Date: Sat, 11 Jun 2022 15:01:16 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <YqSuPPM0rNQaRwlm@zeniv-ca.linux.org.uk>
References: <YqRyL2sIqQNDfky2@debian> <YqSGv6uaZzLxKfmG@zeniv-ca.linux.org.uk>
 <YqSMmC/UuQpXdxtR@zeniv-ca.linux.org.uk>
 <YqSQ++8UnEW0AJ2y@zeniv-ca.linux.org.uk>
 <20220611140052.GA288528@roeck-us.net>
MIME-Version: 1.0
In-Reply-To: <20220611140052.GA288528@roeck-us.net>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Linux-cachefs] mainline build failure due to 6c77676645ad
 ("iov_iter: Fix iter_xarray_get_pages{, _alloc}()")
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Gao Xiang <xiang@kernel.org>, linux-erofs@lists.ozlabs.org,
 linux-afs@lists.infradead.org, devel@lists.orangefs.org,
 Mike Marshall <hubcap@omnibond.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 11, 2022 at 07:00:52AM -0700, Guenter Roeck wrote:
> On Sat, Jun 11, 2022 at 12:56:27PM +0000, Al Viro wrote:
> > On Sat, Jun 11, 2022 at 12:37:44PM +0000, Al Viro wrote:
> > > On Sat, Jun 11, 2022 at 12:12:47PM +0000, Al Viro wrote:
> > > 
> > > 
> > > > At a guess, should be
> > > > 	return min((size_t)nr * PAGE_SIZE - offset, maxsize);
> > > > 
> > > > in both places.  I'm more than half-asleep right now; could you verify that it
> > > > (as the last lines of both iter_xarray_get_pages() and iter_xarray_get_pages_alloc())
> > > > builds correctly?
> > > 
> > > No, I'm misreading it - it's unsigned * unsigned long - unsigned vs. size_t.
> > > On arm it ends up with unsigned long vs. unsigned int; functionally it *is*
> > > OK (both have the same range there), but it triggers the tests.  Try 
> > > 
> > > 	return min_t(size_t, nr * PAGE_SIZE - offset, maxsize);
> > > 
> > > there (both places).
> > 
> > The reason we can't overflow on multiplication there, BTW, is that we have
> > nr <= count, and count has come from weirdly open-coded
> > 	DIV_ROUND_UP(size + offset, PAGE_SIZE)
> 
> That is often done to avoid possible overflows. Is size + offset
> guaranteed to be smaller than ULONG_MAX ?

You'd need iter->count and maxsize argument to be within PAGE_SIZE of
ULONG_MAX.  How would you populate that xarray, anyway?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

