Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDC462F34D
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Nov 2022 12:09:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668769742;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TQ9OtziEnmaNfCV8JfNUjJkZ1oD11wjLFvfD6VnWJsE=;
	b=Ty2/toTGSboWx+eiNtt4jI6Mk4DFaPogfyT819/mxSy8kdqvrJ/sIvKcsA9NwCFsD02QTL
	M897A9YwiWRfrU9C/Gob/rCGfd/+oPDbtTvLUaOyTxfLKq1AyDAVvVIGNIvY6PFTb80LaN
	Mc8WHccMq9RTkWsXfYit9rL+aYLXRDM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-s_y8qh02PO6R52gdoyfHQw-1; Fri, 18 Nov 2022 06:09:01 -0500
X-MC-Unique: s_y8qh02PO6R52gdoyfHQw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F73B1C0A108;
	Fri, 18 Nov 2022 11:09:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5610940C6EC3;
	Fri, 18 Nov 2022 11:09:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9768519465B7;
	Fri, 18 Nov 2022 11:09:00 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 145971946587 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 18 Nov 2022 11:08:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C5000C06218; Fri, 18 Nov 2022 11:08:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FCD9C15BA5;
 Fri, 18 Nov 2022 11:08:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <166869691313.3723671.10714823767342163891.stgit@warthog.procyon.org.uk>
References: <166869691313.3723671.10714823767342163891.stgit@warthog.procyon.org.uk>
 <166869687556.3723671.10061142538708346995.stgit@warthog.procyon.org.uk>
To: Al Viro <viro@zeniv.linux.org.uk>
MIME-Version: 1.0
Date: Fri, 18 Nov 2022 11:08:55 +0000
Message-ID: <231977.1668769735@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Linux-cachefs] [RFC PATCH 4/4] netfs: Add a function to
 extract an iterator into a scatterlist
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
 linux-cifs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
 Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <231976.1668769735.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I updated the patch description to mention that pinning may be used instead of
getting a ref:

    netfs: Add a function to extract an iterator into a scatterlist
    
    Provide a function for filling in a scatterlist from the list of pages
    contained in an iterator.
    
    If the iterator is UBUF- or IOBUF-type, the pages have a ref (WRITE) or a
    pin (READ) taken on them.
    
    If the iterator is BVEC-, KVEC- or XARRAY-type, no ref is taken on the
    pages and it is left to the caller to manage their lifetime.  It cannot be
    assumed that a ref can be validly taken, particularly in the case of a KVEC
    iterator.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

