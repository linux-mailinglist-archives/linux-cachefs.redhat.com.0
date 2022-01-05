Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C501484C81
	for <lists+linux-cachefs@lfdr.de>; Wed,  5 Jan 2022 03:30:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-Ce42OM91MrutOivW9wQNkg-1; Tue, 04 Jan 2022 21:30:16 -0500
X-MC-Unique: Ce42OM91MrutOivW9wQNkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63A5B363A4;
	Wed,  5 Jan 2022 02:30:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98A50519B1;
	Wed,  5 Jan 2022 02:30:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B22254BB7C;
	Wed,  5 Jan 2022 02:30:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2052U6dn010304 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 4 Jan 2022 21:30:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ED15D492CB0; Wed,  5 Jan 2022 02:30:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8AC1492CAF
	for <linux-cachefs@redhat.com>; Wed,  5 Jan 2022 02:30:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD9FB10184A0
	for <linux-cachefs@redhat.com>; Wed,  5 Jan 2022 02:30:05 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
	(out30-44.freemail.mail.aliyun.com [115.124.30.44]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-354-gj0cFFvnPyy6OEZhRIfZ0A-1; Tue, 04 Jan 2022 21:30:02 -0500
X-MC-Unique: gj0cFFvnPyy6OEZhRIfZ0A-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V1-XTae_1641349797
Received: from 30.225.24.102(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V1-XTae_1641349797) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 05 Jan 2022 10:29:58 +0800
Message-ID: <58e983fa-f913-d663-9719-0111b9130688@linux.alibaba.com>
Date: Wed, 5 Jan 2022 10:29:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.2
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, tao.peng@linux.alibaba.com,
	gerry@linux.alibaba.com, eguan@linux.alibaba.com,
	linux-kernel@vger.kernel.org
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
	<20211227125444.21187-14-jefflexu@linux.alibaba.com>
	<YdRcdqIUkqIIw6EP@B-P7TQMD6M-0146.local>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <YdRcdqIUkqIIw6EP@B-P7TQMD6M-0146.local>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH v1 13/23] erofs: implement fscache-based
	data read
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
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 1/4/22 10:40 PM, Gao Xiang wrote:
> On Mon, Dec 27, 2021 at 08:54:34PM +0800, Jeffle Xu wrote:
>> This patch implements the data plane of reading data from bootstrap blob
>> file over fscache.
>>
>> Be noted that currently compressed layout is not supported yet.
>>
>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>> ---
>>  fs/erofs/fscache.c  | 91 +++++++++++++++++++++++++++++++++++++++++++++
>>  fs/erofs/inode.c    |  6 ++-
>>  fs/erofs/internal.h |  1 +
>>  3 files changed, 97 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
>> index 325f5663836b..bfcec831d58a 100644
>> --- a/fs/erofs/fscache.c
>> +++ b/fs/erofs/fscache.c
>> @@ -65,6 +65,97 @@ struct page *erofs_readpage_from_fscache(struct erofs_cookie_ctx *ctx,
>>  	return page;
>>  }
>>  
>> +static inline void do_copy_page(struct page *from, struct page *to,
>> +				size_t offset, size_t len)
>> +{
>> +	char *vfrom, *vto;
>> +
>> +	vfrom = kmap_atomic(from);
>> +	vto = kmap_atomic(to);
>> +	memcpy(vto, vfrom + offset, len);
>> +	kunmap_atomic(vto);
>> +	kunmap_atomic(vfrom);
>> +}
>> +
>> +static int erofs_fscache_do_readpage(struct file *file, struct page *page)
>> +{
>> +	struct inode *inode = page->mapping->host;
>> +	struct erofs_inode *vi = EROFS_I(inode);
>> +	struct super_block *sb = inode->i_sb;
>> +	struct erofs_map_blocks map;
>> +	erofs_off_t o_la, pa;
>> +	size_t offset, len;
>> +	struct page *ipage;
>> +	int ret;
>> +
>> +	if (erofs_inode_is_data_compressed(vi->datalayout)) {
>> +		erofs_info(sb, "compressed layout not supported yet");
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	o_la = page_offset(page);
>> +	map.m_la = o_la;
>> +
>> +	ret = erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!(map.m_flags & EROFS_MAP_MAPPED)) {
>> +		zero_user(page, 0, PAGE_SIZE);
>> +		return 0;
>> +	}
>> +
>> +	/*
>> +	 * 1) For FLAT_PLAIN/FLAT_INLINE layout, the output map.m_la shall be
>> +	 * equal to o_la, and the output map.m_pa is exactly the physical
>> +	 * address of o_la.
>> +	 * 2) For CHUNK_BASED layout, the output map.m_la is rounded down to the
>> +	 * nearest chunk boundary, and the output map.m_pa is actually the
>> +	 * physical address of this chunk boundary. So we need to recalculate
>> +	 * the actual physical address of o_la.
>> +	 */
>> +	pa = map.m_pa + o_la - map.m_la;
>> +
>> +	ipage = erofs_get_meta_page(sb, erofs_blknr(pa));
>> +	if (IS_ERR(ipage))
>> +		return PTR_ERR(ipage);
>> +
>> +	/*
>> +	 * @offset refers to the page offset inside @ipage.
>> +	 * 1) Except for the inline layout, the offset shall all be 0, and @pa
>> +	 * shall be aligned with EROFS_BLKSIZ in this case. Thus we can
>> +	 * conveniently get the offset from @pa.
>> +	 * 2) While for the inline layout, the offset may be non-zero. Since
>> +	 * currently only flat layout supports inline, we can calculate the
>> +	 * offset from the corresponding physical address.
>> +	 */
>> +	offset = erofs_blkoff(pa);
>> +	len = min_t(u64, map.m_llen, PAGE_SIZE);
>> +
>> +	do_copy_page(ipage, page, offset, len);
> 
> If my understanding is correct, I still have no idea why we need to
> copy data here even if fscache can do direct I/O for us without extra
> efforts.
> 
> I think the only case would be tail-packing inline (which should go
> through metadata path), otherwise, all data is block-aligned. So
> fscache can handle it directly.
> 

Right, only tail packing need special handling here. Would be fixed in
the next version. Thanks.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

