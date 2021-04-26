Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1E336B96B
	for <lists+linux-cachefs@lfdr.de>; Mon, 26 Apr 2021 20:54:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-uKDzTyslMySpOLuRedBGkg-1; Mon, 26 Apr 2021 14:54:34 -0400
X-MC-Unique: uKDzTyslMySpOLuRedBGkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAEAD107ACF4;
	Mon, 26 Apr 2021 18:54:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 295EB1002EE6;
	Mon, 26 Apr 2021 18:54:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DFED44A58;
	Mon, 26 Apr 2021 18:54:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13QIsN9R018114 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 14:54:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 09A19208BDC2; Mon, 26 Apr 2021 18:54:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04818200B68D
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 18:54:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BF0D185A7A5
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 18:54:19 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-558-CpqPhmgZPGaqd7o0g17pJg-1; Mon, 26 Apr 2021 14:54:15 -0400
X-MC-Unique: CpqPhmgZPGaqd7o0g17pJg-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lb6N2-008TLy-M3; Mon, 26 Apr 2021 18:54:12 +0000
Date: Mon, 26 Apr 2021 18:54:12 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: David Howells <dhowells@redhat.com>
Message-ID: <YIcMVCkp4xswHolw@zeniv-ca.linux.org.uk>
References: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Dominique Martinet <asmadeus@codewreck.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v7 01/31] iov_iter: Add ITER_XARRAY
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 23, 2021 at 02:28:01PM +0100, David Howells wrote:
> -#define iterate_all_kinds(i, n, v, I, B, K) {			\
> +#define iterate_xarray(i, n, __v, skip, STEP) {		\
> +	struct page *head = NULL;				\
> +	size_t wanted = n, seg, offset;				\
> +	loff_t start = i->xarray_start + skip;			\
> +	pgoff_t index = start >> PAGE_SHIFT;			\
> +	int j;							\
> +								\
> +	XA_STATE(xas, i->xarray, index);			\
> +								\
> +	rcu_read_lock();						\
> +	xas_for_each(&xas, head, ULONG_MAX) {				\
> +		if (xas_retry(&xas, head))				\
> +			continue;					\

OK, now I'm really confused; what's to guarantee that restart will not have
you hit the same entry more than once?  STEP might be e.g.

		memcpy_to_page(v.bv_page, v.bv_offset,
			       (from += v.bv_len) - v.bv_len, v.bv_len)

which is clearly not idempotent - from gets incremented, after all.
What am I missing here?

> +		if (WARN_ON(xa_is_value(head)))				\
> +			break;						\
> +		if (WARN_ON(PageHuge(head)))				\
> +			break;						\
> +		for (j = (head->index < index) ? index - head->index : 0; \
> +		     j < thp_nr_pages(head); j++) {			\
> +			__v.bv_page = head + j;				\
> +			offset = (i->xarray_start + skip) & ~PAGE_MASK;	\
> +			seg = PAGE_SIZE - offset;			\
> +			__v.bv_offset = offset;				\
> +			__v.bv_len = min(n, seg);			\
> +			(void)(STEP);					\
> +			n -= __v.bv_len;				\
> +			skip += __v.bv_len;				\
> +			if (n == 0)					\
> +				break;					\
> +		}							\
> +		if (n == 0)						\
> +			break;						\
> +	}							\
> +	rcu_read_unlock();					\
> +	n = wanted - n;						\
> +}

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

