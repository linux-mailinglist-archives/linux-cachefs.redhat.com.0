Return-Path: <linux-cachefs+bncBDLIXLMFVAERBUMZ46VQMGQERCL45GA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mail.lfdr.de (Postfix) with ESMTPS id C473E81164C
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:25:06 +0100 (CET)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-77f38f2f6fbsf1097250185a.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:25:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481105; cv=pass;
        d=google.com; s=arc-20160816;
        b=h/Kq0qtzhLwc5vyYCri///3fTe7N4CRks1akMc7AXCuZtp7yUTfp2FB5VrQ3VXrBzP
         CNpmXwHrxGKpJ7Ludn78d0L8mKX+U2PYeIH7ig8ofikJ10HOASpJ5k+1N75g1QR8geVV
         +PXSEo2GKylX9Cx7OK+eM6BKO+n4+pqHM9HoRswWRGUVu7TE46Sn0KI5B5dQw/FTEBbL
         NNVSfe/CoxniRArtycXYNufcU01bYbH0c7c9hLPFTsbMtRYyfAGywn4x+9+j4RUJvcLv
         srwYtH7IJNWzjENapQ3YMzYVaOhzKXtgJfq9qAbGxvSfX+Wc3cxzZs8BXyIDPVrTkJeD
         wpjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=B9e84crUarhjiflgQAXm42xDNocoYu7MSYxRXz3HXyk=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=hTACWgbXWnrNmOgZdBf9R7v3rQ0UX6giXjiHbVIvGorMw2QhZyP6nxRNmu3FVgY9SR
         kWVDG+qEItono3PYAREfZGTqqzX4uPOtTOg3V9NJWff1CmVXF++eQLNj5EcXxiLwP/Lc
         Ar5ITBJw4CsMobBziNLbwX6qIE9zn8KAohNJWwsXD86ZamjptJxsdkktxnipK4UsabO5
         Q/son4Re5JQkVxsSOSOt1+lxZhwyz1AiJVT6McaY/cKDPuC7HFuhR/J+vH9Brd8Yz0/r
         SHPf7G6s6PvOC5jHpaIOK1wsgGDMOVSuKSq89SSKOlONiDwQj3x9MwFZnkUWnxtCLFYv
         uSyw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481105; x=1703085905;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9e84crUarhjiflgQAXm42xDNocoYu7MSYxRXz3HXyk=;
        b=nrv9QKPtpRXpoxFOEpliwNCyc0TTEawuNXXqV88EtnRf2efgrb5o1nC+2HjGFUwXL7
         AA8ZdC0u9LzllsLsYzuQ+zPySO+5ucwfFzzwK0vlMzVup1aly2b7xCIFv3Ob9ozwpHfn
         aTXUgdRUkdYditA6KCLHzaUQZoYr/MWyqNkDDa2gAtslfKMCnxGH0x1wlsCbOt0+lgAo
         VjwnxGAToawbMmiqlBjb7K/beMasvGMFXrzUyf+i301f+yl86Pj6FQqNgwC1n1oF6dxF
         uRdmhRgqfo1W+12V+FjuD+5XQDEEJty1rlX9g+oMvpnhb3dRgey2q4vUE8x4m8xjRmXV
         ZeBg==
X-Gm-Message-State: AOJu0YyCrkh6nqyXhTGcD8rFDafdMgyVite6kTLQrZgiX+1uyih9WymP
	2l5R5bB8FlqOVsP6i8AfcS5sJg==
X-Google-Smtp-Source: AGHT+IFG3skwxFUPfn77Eie0cF51b8W7tDSWqAoPdT16YsdWl7jCPPGQaly3F4JMCj9gdLsz9dzUhA==
X-Received: by 2002:a05:620a:1a23:b0:77d:7ace:4a6 with SMTP id bk35-20020a05620a1a2300b0077d7ace04a6mr15351338qkb.2.1702481105662;
        Wed, 13 Dec 2023 07:25:05 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:199a:b0:423:707e:9eb with SMTP id
 u26-20020a05622a199a00b00423707e09ebls550492qtc.0.-pod-prod-00-us; Wed, 13
 Dec 2023 07:25:05 -0800 (PST)
X-Received: by 2002:a37:e10c:0:b0:77e:fba3:3e6e with SMTP id c12-20020a37e10c000000b0077efba33e6emr11517289qkm.55.1702481105157;
        Wed, 13 Dec 2023 07:25:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481105; cv=none;
        d=google.com; s=arc-20160816;
        b=Ma4UJLOFxhlTlAUPIGn91DDT0jzcRly25uHU8Q+WL586JEoitddJs9yH+BaBAQPf/e
         6dxm37di5r3bieCLor/rWENuvyZtzkil7DhWcYcS8KgZl4RG4/DlXePjgo5Mzo6/0CgW
         FAdDhAAtNHTCf0gbyiy+0kDHNr+XEJfASfZrMhgd93/uh5a2Jg8OnwFViBr32/ICzavv
         UNEsC/iDr6+TZJTVQJ4k5U/AIlZm/QigTvh3g9ecQ1unZJlqum+mvJAqXimbzjEybgYh
         qmL7ARZoSNLM/T3fXEYrJIhQp8lUC+S+2F2zeBSQESIGqXTEH/nXTNwBw7lLbk4e75Zl
         T90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=kDE/M1RbzgmjQWasqi03vRWSNjlBlYY2O7ZHPetmOEs=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=R7kVSNYxw6BDgfOcCxQatJhF/brg6itgFJXvBIcREUE4KjhFEhxi+q0fUVeT+cwsZL
         /+J116glM2V/Am8CgjcGHRZHMvDhw+NYuvfTCG5GtksOmgH0U03wm5qVxmVSLfLEpX96
         N0moqL1fAztTR+HtTAGDJi73lZesl81XMqjXSBgSwGozbte2s3+ZQIJbn9JgAM9gvX4S
         RqAX+ybAWNTjYhbndDJVNViUrsirbwb4cjMXvcDdN1chRK6AMxKaJajnQCxMy+zSnPL6
         H+0COg9DoZy+K+eo+u4SNj/654uGnK9nLg9pj1cXfCAH2pbW9eIqF9JIbCpXENHARwj6
         wShg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id c5-20020a05620a268500b0077f13249d4bsi13940820qkp.654.2023.12.13.07.25.05
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:25:05 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-h5P44KStOwup0I4UiX8wpw-1; Wed,
 13 Dec 2023 10:25:03 -0500
X-MC-Unique: h5P44KStOwup0I4UiX8wpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CD191C0434A
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:25:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 7367C5190; Wed, 13 Dec 2023 15:25:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 592C451E3;
	Wed, 13 Dec 2023 15:24:59 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/39] netfs: Add func to calculate pagecount/size-limited span of an iterator
Date: Wed, 13 Dec 2023 15:23:26 +0000
Message-ID: <20231213152350.431591-17-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Add a function to work out how much of an ITER_BVEC or ITER_XARRAY iterator
we can use in a pagecount-limited and size-limited span.  This will be
used, for example, to limit the number of segments in a subrequest to the
maximum number of elements that an RDMA transfer can handle.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/iterator.c   | 97 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h |  2 +
 2 files changed, 99 insertions(+)

diff --git a/fs/netfs/iterator.c b/fs/netfs/iterator.c
index 2ff07ba655a0..b781bbbf1d8d 100644
--- a/fs/netfs/iterator.c
+++ b/fs/netfs/iterator.c
@@ -101,3 +101,100 @@ ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
 	return npages;
 }
 EXPORT_SYMBOL_GPL(netfs_extract_user_iter);
+
+/*
+ * Select the span of a bvec iterator we're going to use.  Limit it by both maximum
+ * size and maximum number of segments.  Returns the size of the span in bytes.
+ */
+static size_t netfs_limit_bvec(const struct iov_iter *iter, size_t start_offset,
+			       size_t max_size, size_t max_segs)
+{
+	const struct bio_vec *bvecs = iter->bvec;
+	unsigned int nbv = iter->nr_segs, ix = 0, nsegs = 0;
+	size_t len, span = 0, n = iter->count;
+	size_t skip = iter->iov_offset + start_offset;
+
+	if (WARN_ON(!iov_iter_is_bvec(iter)) ||
+	    WARN_ON(start_offset > n) ||
+	    n == 0)
+		return 0;
+
+	while (n && ix < nbv && skip) {
+		len = bvecs[ix].bv_len;
+		if (skip < len)
+			break;
+		skip -= len;
+		n -= len;
+		ix++;
+	}
+
+	while (n && ix < nbv) {
+		len = min3(n, bvecs[ix].bv_len - skip, max_size);
+		span += len;
+		nsegs++;
+		ix++;
+		if (span >= max_size || nsegs >= max_segs)
+			break;
+		skip = 0;
+		n -= len;
+	}
+
+	return min(span, max_size);
+}
+
+/*
+ * Select the span of an xarray iterator we're going to use.  Limit it by both
+ * maximum size and maximum number of segments.  It is assumed that segments
+ * can be larger than a page in size, provided they're physically contiguous.
+ * Returns the size of the span in bytes.
+ */
+static size_t netfs_limit_xarray(const struct iov_iter *iter, size_t start_offset,
+				 size_t max_size, size_t max_segs)
+{
+	struct folio *folio;
+	unsigned int nsegs = 0;
+	loff_t pos = iter->xarray_start + iter->iov_offset;
+	pgoff_t index = pos / PAGE_SIZE;
+	size_t span = 0, n = iter->count;
+
+	XA_STATE(xas, iter->xarray, index);
+
+	if (WARN_ON(!iov_iter_is_xarray(iter)) ||
+	    WARN_ON(start_offset > n) ||
+	    n == 0)
+		return 0;
+	max_size = min(max_size, n - start_offset);
+
+	rcu_read_lock();
+	xas_for_each(&xas, folio, ULONG_MAX) {
+		size_t offset, flen, len;
+		if (xas_retry(&xas, folio))
+			continue;
+		if (WARN_ON(xa_is_value(folio)))
+			break;
+		if (WARN_ON(folio_test_hugetlb(folio)))
+			break;
+
+		flen = folio_size(folio);
+		offset = offset_in_folio(folio, pos);
+		len = min(max_size, flen - offset);
+		span += len;
+		nsegs++;
+		if (span >= max_size || nsegs >= max_segs)
+			break;
+	}
+
+	rcu_read_unlock();
+	return min(span, max_size);
+}
+
+size_t netfs_limit_iter(const struct iov_iter *iter, size_t start_offset,
+			size_t max_size, size_t max_segs)
+{
+	if (iov_iter_is_bvec(iter))
+		return netfs_limit_bvec(iter, start_offset, max_size, max_segs);
+	if (iov_iter_is_xarray(iter))
+		return netfs_limit_xarray(iter, start_offset, max_size, max_segs);
+	BUG();
+}
+EXPORT_SYMBOL(netfs_limit_iter);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 8a5b8e7bc358..a30b47e10797 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -324,6 +324,8 @@ void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
 ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
 				struct iov_iter *new,
 				iov_iter_extraction_t extraction_flags);
+size_t netfs_limit_iter(const struct iov_iter *iter, size_t start_offset,
+			size_t max_size, size_t max_segs);
 
 int netfs_start_io_read(struct inode *inode);
 void netfs_end_io_read(struct inode *inode);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

