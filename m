Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 509D062DEB2
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Nov 2022 15:54:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668696885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3nSC9asOKweSjUwjbDu+pSys6iRfKqQNbUe4Fc6yPTs=;
	b=ZobVT18zrymAMq3OGwMiVKHGh8bazKt/zU92jYtaTSV167WdHlDAqs/OPic3/hZ8UF+o0l
	tKfvl4zAXa23rkS8XLVHQcWIlPqgUhQscpDT6kAIdGPLC755h4p1o8/8gCrhGMyq4FXgHu
	SPgctQXdjnJgIzYi017rmUAD9IuJekY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-QPMFpXbHMm6yP2xVq8N7jQ-1; Thu, 17 Nov 2022 09:54:43 -0500
X-MC-Unique: QPMFpXbHMm6yP2xVq8N7jQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FE601C0A108;
	Thu, 17 Nov 2022 14:54:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21AE0492B04;
	Thu, 17 Nov 2022 14:54:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EC7BB19465A4;
	Thu, 17 Nov 2022 14:54:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 652571946595 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 14:54:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 45EE52028E94; Thu, 17 Nov 2022 14:54:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B1DB2028E8F;
 Thu, 17 Nov 2022 14:54:38 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Date: Thu, 17 Nov 2022 14:54:35 +0000
Message-ID: <166869687556.3723671.10061142538708346995.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.5
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Linux-cachefs] [RFC PATCH 0/4] iov_iter: Add extraction helpers
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
 Christoph Hellwig <hch@infradead.org>,
 Rohith Surabattula <rohiths.msft@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Steve French <sfrench@samba.org>, linux-mm@kvack.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Al,

Here are four patches to provide support for extracting pages from an
iov_iter, where such a thing makes sense, if you could take a look?

The first couple of patches provide iov_iter general stuff:

 (1) Move the FOLL_* flags to linux/mm_types.h so that linux/uio.h can make
     use of them.

 (2) Add a function to list-only, get or pin pages from an iterator as a
     future replacement for iov_iter_get_pages*().  Pointers to the pages
     are placed into an array (which will get allocated if not provided)
     and, depending on the iterator type and direction, the pages will have
     a ref or a pin get on them, or left untouched (on the assumption that
     the caller manages their lifetime).

     The determination is:

	UBUF/IOVEC + READ	-> pin
	UBUF/IOVEC + WRITE	-> get
	PIPE + READ		-> list-only
	BVEC/XARRAY		-> list-only
	Anything else		-> EFAULT

     It also adds a function by which the caller can determine which of
     "list only, get or pin" the extraction function will actually do to
     aid in cleaning up (returning 0, FOLL_GET or FOLL_PIN as appropriate).

Then there are a couple of patches that add stuff to netfslib that I want
to use there as well as in cifs:

 (3) Add a netfslib function to use (2) to extract pages from an ITER_IOBUF
     or ITER_UBUF iterator into an ITER_BVEC iterator.  This will get or
     pin the pages as appropriate.

 (4) Add a netfslib function to extract pages from an iterator that's of
     type ITER_UBUF/IOVEC/BVEC/KVEC/XARRAY and add them to a scatterlist.

     The function in (2) is used for a UBUF and IOVEC iterators, so those
     need cleaning up afterwards.  BVEC and XARRAY iterators are ungot and
     unpinned and may be rendered into elements that span multiple pages,
     for example if large folios are present.

I've pushed the patches here also:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=iov-extract

David

Link: https://lore.kernel.org/r/166697254399.61150.1256557652599252121.stgit@warthog.procyon.org.uk/
---
David Howells (4):
      mm: Move FOLL_* defs to mm_types.h
      iov_iter: Add a function to extract a page list from an iterator
      netfs: Add a function to extract a UBUF or IOVEC into a BVEC iterator
      netfs: Add a function to extract an iterator into a scatterlist


 fs/netfs/Makefile        |   1 +
 fs/netfs/iterator.c      | 346 +++++++++++++++++++++++++++++++++++++++
 include/linux/mm.h       |  74 ---------
 include/linux/mm_types.h |  73 +++++++++
 include/linux/netfs.h    |   5 +
 include/linux/uio.h      |  29 ++++
 lib/iov_iter.c           | 333 +++++++++++++++++++++++++++++++++++++
 mm/vmalloc.c             |   1 +
 8 files changed, 788 insertions(+), 74 deletions(-)
 create mode 100644 fs/netfs/iterator.c


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

