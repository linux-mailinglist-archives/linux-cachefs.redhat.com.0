Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E9E4DD472
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Mar 2022 06:42:20 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-zJXjQHdmNnCbS9dvaLUO9A-1; Fri, 18 Mar 2022 01:42:16 -0400
X-MC-Unique: zJXjQHdmNnCbS9dvaLUO9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 052511C04B54;
	Fri, 18 Mar 2022 05:42:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B944B53C6;
	Fri, 18 Mar 2022 05:42:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 83E9E194E015;
	Fri, 18 Mar 2022 05:42:14 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B7CBC1949761 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 18 Mar 2022 05:42:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 17B87C26E8E; Fri, 18 Mar 2022 05:42:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13DE8C26E85
 for <linux-cachefs@redhat.com>; Fri, 18 Mar 2022 05:42:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE19E801E67
 for <linux-cachefs@redhat.com>; Fri, 18 Mar 2022 05:42:12 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-f8juwncoP7Ke7Kg9wGMnng-1; Fri, 18 Mar 2022 01:42:05 -0400
X-MC-Unique: f8juwncoP7Ke7Kg9wGMnng-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R261e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=16; SR=0; TI=SMTPD_---0V7V4qT._1647582119
Received: from 30.225.24.52(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V7V4qT._1647582119) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 18 Mar 2022 13:42:00 +0800
Message-ID: <be2a500d-f8f3-f813-cb9e-04ac1726e22d@linux.alibaba.com>
Date: Fri, 18 Mar 2022 13:41:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org,
 torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
 willy@infradead.org, linux-fsdevel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 tao.peng@linux.alibaba.com, gerry@linux.alibaba.com,
 eguan@linux.alibaba.com, linux-kernel@vger.kernel.org,
 luodaowen.backend@bytedance.com
References: <20220316131723.111553-1-jefflexu@linux.alibaba.com>
 <20220316131723.111553-22-jefflexu@linux.alibaba.com>
 <YjLFsCLeEU9glmNf@B-P7TQMD6M-0146.local>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <YjLFsCLeEU9glmNf@B-P7TQMD6M-0146.local>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v5 21/22] erofs: implement fscache-based
 data readahead
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
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 3/17/22 1:22 PM, Gao Xiang wrote:
> On Wed, Mar 16, 2022 at 09:17:22PM +0800, Jeffle Xu wrote:
>> This patch implements fscache-based data readahead. Also registers an
>> individual bdi for each erofs instance to enable readahead.
>>
>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>> ---
>>  fs/erofs/fscache.c | 153 +++++++++++++++++++++++++++++++++++++++++++++
>>  fs/erofs/super.c   |   4 ++
>>  2 files changed, 157 insertions(+)
>>
>> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
>> index 82c52b6e077e..913ca891deb9 100644
>> --- a/fs/erofs/fscache.c
>> +++ b/fs/erofs/fscache.c
>> @@ -10,6 +10,13 @@ struct erofs_fscache_map {
>>  	u64 m_llen;
>>  };
>>  
>> +struct erofs_fscahce_ra_ctx {
> 
> typo,  should be `erofs_fscache_ra_ctx'

Oops. Thanks.


> 
>> +	struct readahead_control *rac;
>> +	struct address_space *mapping;
>> +	loff_t start;
>> +	size_t len, done;
>> +};
>> +
>>  static struct fscache_volume *volume;
>>  
>>  /*
>> @@ -199,12 +206,158 @@ static int erofs_fscache_readpage(struct file *file, struct page *page)
>>  	return ret;
>>  }
>>  
>> +static inline size_t erofs_fscache_calc_len(struct erofs_fscahce_ra_ctx *ractx,
>> +					    struct erofs_fscache_map *fsmap)
>> +{
>> +	/*
>> +	 * 1) For CHUNK_BASED layout, the output m_la is rounded down to the
>> +	 * nearest chunk boundary, and the output m_llen actually starts from
>> +	 * the start of the containing chunk.
>> +	 * 2) For other cases, the output m_la is equal to o_la.
>> +	 */
>> +	size_t len = fsmap->m_llen - (fsmap->o_la - fsmap->m_la);
>> +
>> +	return min_t(size_t, len, ractx->len - ractx->done);
>> +}
>> +
>> +static inline void erofs_fscache_unlock_pages(struct readahead_control *rac,
>> +					      size_t len)
> 
> Can we convert them into folios in advance? it seems much
> straight-forward to convert these...
> 
> Or I have to convert them later, and it seems unnecessary...

OK I will try to use folio API in the next version.


> 
> 
>> +{
>> +	while (len) {
>> +		struct page *page = readahead_page(rac);
>> +
>> +		SetPageUptodate(page);
>> +		unlock_page(page);
>> +		put_page(page);
>> +
>> +		len -= PAGE_SIZE;
>> +	}
>> +}
>> +
>> +static int erofs_fscache_ra_hole(struct erofs_fscahce_ra_ctx *ractx,
>> +				 struct erofs_fscache_map *fsmap)
>> +{
>> +	struct iov_iter iter;
>> +	loff_t start = ractx->start + ractx->done;
>> +	size_t length = erofs_fscache_calc_len(ractx, fsmap);
>> +
>> +	iov_iter_xarray(&iter, READ, &ractx->mapping->i_pages, start, length);
>> +	iov_iter_zero(length, &iter);
>> +
>> +	erofs_fscache_unlock_pages(ractx->rac, length);
>> +	return length;
>> +}
>> +
>> +static int erofs_fscache_ra_noinline(struct erofs_fscahce_ra_ctx *ractx,
>> +				     struct erofs_fscache_map *fsmap)
>> +{
>> +	struct fscache_cookie *cookie = fsmap->m_ctx->cookie;
>> +	loff_t start = ractx->start + ractx->done;
>> +	size_t length = erofs_fscache_calc_len(ractx, fsmap);
>> +	loff_t pstart = fsmap->m_pa + (fsmap->o_la - fsmap->m_la);
>> +	int ret;
>> +
>> +	ret = erofs_fscache_read_pages(cookie, ractx->mapping,
>> +				       start, length, pstart);
>> +	if (!ret) {
>> +		erofs_fscache_unlock_pages(ractx->rac, length);
>> +		ret = length;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int erofs_fscache_ra_inline(struct erofs_fscahce_ra_ctx *ractx,
>> +				   struct erofs_fscache_map *fsmap)
>> +{
> 
> We could fold in this, since it has the only user.

OK, and "struct erofs_fscahce_ra_ctx" is not needed then.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

