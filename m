Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD93C464975
	for <lists+linux-cachefs@lfdr.de>; Wed,  1 Dec 2021 09:18:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-535-DV6aUcdRMS2TTLukV9RRkQ-1; Wed, 01 Dec 2021 03:18:30 -0500
X-MC-Unique: DV6aUcdRMS2TTLukV9RRkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F4C61F6AC;
	Wed,  1 Dec 2021 08:18:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1262545D67;
	Wed,  1 Dec 2021 08:18:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 029D14BB7B;
	Wed,  1 Dec 2021 08:18:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B15pUMb011429 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 1 Dec 2021 00:51:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1A4651402406; Wed,  1 Dec 2021 05:51:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14EAE1402400
	for <linux-cachefs@redhat.com>; Wed,  1 Dec 2021 05:51:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6523811E76
	for <linux-cachefs@redhat.com>; Wed,  1 Dec 2021 05:51:29 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
	(out30-54.freemail.mail.aliyun.com [115.124.30.54]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-426-4LDIlcLzM5alg1yGE4MF7A-1; Wed, 01 Dec 2021 00:51:28 -0500
X-MC-Unique: 4LDIlcLzM5alg1yGE4MF7A-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=18; SR=0;
	TI=SMTPD_---0UywY0em_1638337562
Received: from 30.225.24.24(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UywY0em_1638337562) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 01 Dec 2021 13:46:04 +0800
Message-ID: <bcefb8f2-576a-b3fc-cc29-89808ebfd7c1@linux.alibaba.com>
Date: Wed, 1 Dec 2021 13:46:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.0
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
References: <163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
	<163819640393.215744.15212364106412961104.stgit@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <163819640393.215744.15212364106412961104.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 01 Dec 2021 03:17:19 -0500
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 44/64] cachefiles: Implement key to
	filename encoding
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 11/29/21 10:33 PM, David Howells wrote:

> +/*
> + * turn the raw key into something cooked
> + * - the key may be up to NAME_MAX in length (including the length word)
> + *   - "base64" encode the strange keys, mapping 3 bytes of raw to four of
> + *     cooked
> + *   - need to cut the cooked key into 252 char lengths (189 raw bytes)
> + */
> +bool cachefiles_cook_key(struct cachefiles_object *object)
> +{
> +	const u8 *key = fscache_get_key(object->cookie), *kend;
> +	unsigned char ch;
> +	unsigned int acc, i, n, nle, nbe, keylen = object->cookie->key_len;
> +	unsigned int b64len, len, print, pad;
> +	char *name, sep;
> +
> +	_enter(",%u,%*phN", keylen, keylen, key);
> +
> +	BUG_ON(keylen > NAME_MAX - 3);
> +
> +	print = 1;
> +	for (i = 0; i < keylen; i++) {
> +		ch = key[i];
> +		print &= cachefiles_filecharmap[ch];
> +	}
> +
> +	/* If the path is usable ASCII, then we render it directly */
> +	if (print) {
> +		len = 1 + keylen + 1;
> +		name = kmalloc(len, GFP_KERNEL);
> +		if (!name)
> +			return false;
> +
> +		name[0] = 'D'; /* Data object type, string encoding */
> +		name[1 + keylen] = 0;
> +		memcpy(name + 1, key, keylen);
> +		goto success;
			^
If we goto success from here,

> +	}
> +
> +	/* See if it makes sense to encode it as "hex,hex,hex" for each 32-bit
> +	 * chunk.  We rely on the key having been padded out to a whole number
> +	 * of 32-bit words.
> +	 */
> +	n = round_up(keylen, 4);
> +	nbe = nle = 0;
> +	for (i = 0; i < n; i += 4) {
> +		u32 be = be32_to_cpu(*(__be32 *)(key + i));
> +		u32 le = le32_to_cpu(*(__le32 *)(key + i));
> +
> +		nbe += 1 + how_many_hex_digits(be);
> +		nle += 1 + how_many_hex_digits(le);
> +	}
> +
> +	b64len = DIV_ROUND_UP(keylen, 3);
> +	pad = b64len * 3 - keylen;
> +	b64len = 2 + b64len * 4; /* Length if we base64-encode it */
> +	_debug("len=%u nbe=%u nle=%u b64=%u", keylen, nbe, nle, b64len);
> +	if (nbe < b64len || nle < b64len) {
> +		unsigned int nlen = min(nbe, nle) + 1;
> +		name = kmalloc(nlen, GFP_KERNEL);
> +		if (!name)
> +			return false;
> +		sep = (nbe <= nle) ? 'S' : 'T'; /* Encoding indicator */
> +		len = 0;
> +		for (i = 0; i < n; i += 4) {
> +			u32 x;
> +			if (nbe <= nle)
> +				x = be32_to_cpu(*(__be32 *)(key + i));
> +			else
> +				x = le32_to_cpu(*(__le32 *)(key + i));
> +			name[len++] = sep;
> +			if (x != 0)
> +				len += snprintf(name + len, nlen - len, "%x", x);
> +			sep = ',';
> +		}
> +		goto success;
> +	}
> +
> +	/* We need to base64-encode it */
> +	name = kmalloc(b64len + 1, GFP_KERNEL);
> +	if (!name)
> +		return false;
> +
> +	name[0] = 'E';
> +	name[1] = '0' + pad;
> +	len = 2;
> +	kend = key + keylen;
> +	do {
> +		acc  = *key++;
> +		if (key < kend) {
> +			acc |= *key++ << 8;
> +			if (key < kend)
> +				acc |= *key++ << 16;
> +		}
> +
> +		name[len++] = cachefiles_charmap[acc & 63];
> +		acc >>= 6;
> +		name[len++] = cachefiles_charmap[acc & 63];
> +		acc >>= 6;
> +		name[len++] = cachefiles_charmap[acc & 63];
> +		acc >>= 6;
> +		name[len++] = cachefiles_charmap[acc & 63];
> +	} while (key < kend);
> +
> +success:
> +	name[len] = 0;
	     ^
then it seems that this will cause an out-of-boundary access.


> +	object->d_name = name;
> +	object->d_name_len = len;
> +	_leave(" = %s", object->d_name);
> +	return true;
> +}
> 

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

