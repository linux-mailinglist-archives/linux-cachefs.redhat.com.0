Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6547D36B9F9
	for <lists+linux-cachefs@lfdr.de>; Mon, 26 Apr 2021 21:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619465292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=08XB+M95bKXUQkASTq9m67nak4WuERoxCVTzYwtiQw4=;
	b=GwX1GZyknqOVV/VVpJe+phIEdPY+uFBKJn8hYQz15Rf1U5pWMuXBZF2yMasA7m2EcYPLVH
	+RuBeRFmX4xJDuuqRY9iSRKIJUtE4b3XTvt49IKYbr8mPiWEusgQJjCL93iKKxUcNwphqF
	AJmSXH5ZhRUwijlTMoYuAzyQSN27UH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-WJhVFUCfMHikcwVTdZDehw-1; Mon, 26 Apr 2021 15:28:10 -0400
X-MC-Unique: WJhVFUCfMHikcwVTdZDehw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE3336D585;
	Mon, 26 Apr 2021 19:28:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89FF25D9CD;
	Mon, 26 Apr 2021 19:28:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D61531806D1B;
	Mon, 26 Apr 2021 19:28:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13QJFjkg020977 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 15:15:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A23B4208BDFD; Mon, 26 Apr 2021 19:15:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C95E208DDAD
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 19:15:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1702B185A7B5
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 19:15:43 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-557-W2aCE27XO2iFGDogB3c2FQ-1; Mon, 26 Apr 2021 15:15:41 -0400
X-MC-Unique: W2aCE27XO2iFGDogB3c2FQ-1
Received: by mail-qt1-f199.google.com with SMTP id
	p8-20020a05622a0488b02901bab8dfa0c5so2100570qtx.1
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 12:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NjlPen1encdZDkGM0wilUuVPtH5U8CDDV8DYPkgdQBU=;
	b=lT8Ljdf65Mfb1mCFICHkxSpxMv8FDCCmN4qjktI90AvCE7UiVUzETTGFMqyePszESm
	M2VWitCmqQRMfVycXhtO4AUhzcHSkHUN2aRvF1Lw+TQFrHqc+C0zQvs9ZcKhP63U8ozK
	F4vRsy3LnRUy5cfvr4l+C8XEp6BiUBc1+NJATSyyaYO3J74F4pJzWV8iTZOAeIWacOgG
	rFBYlOKVsKIZ45AHlBsXyX6yR8K9vNUahgFdSZrNM+p8ozLF/BddYw0s5C/epXC9AgJC
	Hs9gWEryxY6jXAzweBkKoVx9WUPi/cjwkkdHg7DlUgtAooPBvHOSSIvJ5Qs15I1rX0yP
	i+TQ==
X-Gm-Message-State: AOAM532kLcRaDYP4sp4YJaTReTQHcYcCDZlBDTpqL1J+RwsV8NHuaxGp
	WgFIU/NqJ107eQcSso/xfkXx2N1pDmMGM3bMS8d64xW8RuczBMzcuVq/1eMB/PqNRnF8VFmvJp4
	CsQCqjq3uXw/PhXl+8wr8jw==
X-Received: by 2002:a37:de14:: with SMTP id h20mr18965526qkj.34.1619464540669; 
	Mon, 26 Apr 2021 12:15:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZYRAHl+eWnQtgdg3ck30c64eIGwlxsQ5wJdm+wrQWh9LXuumEJb2NQlXbEra5jinaPsZTlQ==
X-Received: by 2002:a37:de14:: with SMTP id h20mr18965510qkj.34.1619464540455; 
	Mon, 26 Apr 2021 12:15:40 -0700 (PDT)
Received: from [192.168.1.180] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
	[68.20.15.154]) by smtp.gmail.com with ESMTPSA id
	c15sm12638215qtg.31.2021.04.26.12.15.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 26 Apr 2021 12:15:40 -0700 (PDT)
Message-ID: <8114b7a1151edf52e3a20cf30d2673cd177191bf.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>
Date: Mon, 26 Apr 2021 15:15:39 -0400
In-Reply-To: <YIcMVCkp4xswHolw@zeniv-ca.linux.org.uk>
References: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<161918448151.3145707.11541538916600921083.stgit@warthog.procyon.org.uk>
	<YIcMVCkp4xswHolw@zeniv-ca.linux.org.uk>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 26 Apr 2021 15:28:04 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, Dominique,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Trond,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Martinet <asmadeus@codewreck.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Myklebust <trond.myklebust@hammerspace.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-04-26 at 18:54 +0000, Al Viro wrote:
> On Fri, Apr 23, 2021 at 02:28:01PM +0100, David Howells wrote:
> > -#define iterate_all_kinds(i, n, v, I, B, K) {			\
> > +#define iterate_xarray(i, n, __v, skip, STEP) {		\
> > +	struct page *head = NULL;				\
> > +	size_t wanted = n, seg, offset;				\
> > +	loff_t start = i->xarray_start + skip;			\
> > +	pgoff_t index = start >> PAGE_SHIFT;			\
> > +	int j;							\
> > +								\
> > +	XA_STATE(xas, i->xarray, index);			\
> > +								\
> > +	rcu_read_lock();						\
> > +	xas_for_each(&xas, head, ULONG_MAX) {				\
> > +		if (xas_retry(&xas, head))				\
> > +			continue;					\
> 
> OK, now I'm really confused; what's to guarantee that restart will not have
> you hit the same entry more than once?  STEP might be e.g.
> 
> 		memcpy_to_page(v.bv_page, v.bv_offset,
> 			       (from += v.bv_len) - v.bv_len, v.bv_len)
> 
> which is clearly not idempotent - from gets incremented, after all.
> What am I missing here?
> 

Not sure I understand the issue you see. If xas_retry returns true,
we'll restart, but we won't have called STEP yet for that entry. I
don't see how we'd retry there and have an issue with idempotency.

> > +		if (WARN_ON(xa_is_value(head)))				\
> > +			break;						\
> > +		if (WARN_ON(PageHuge(head)))				\
> > +			break;						\
> > +		for (j = (head->index < index) ? index - head->index : 0; \
> > +		     j < thp_nr_pages(head); j++) {			\
> > +			__v.bv_page = head + j;				\
> > +			offset = (i->xarray_start + skip) & ~PAGE_MASK;	\
> > +			seg = PAGE_SIZE - offset;			\
> > +			__v.bv_offset = offset;				\
> > +			__v.bv_len = min(n, seg);			\
> > +			(void)(STEP);					\
> > +			n -= __v.bv_len;				\
> > +			skip += __v.bv_len;				\
> > +			if (n == 0)					\
> > +				break;					\
> > +		}							\
> > +		if (n == 0)						\
> > +			break;						\
> > +	}							\
> > +	rcu_read_unlock();					\
> > +	n = wanted - n;						\
> > +}


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

