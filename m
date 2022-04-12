Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4144FCCED
	for <lists+linux-cachefs@lfdr.de>; Tue, 12 Apr 2022 05:17:22 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-zEBkbgAQOQG_MkTx9WrfIA-1; Mon, 11 Apr 2022 23:17:18 -0400
X-MC-Unique: zEBkbgAQOQG_MkTx9WrfIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0883D3C02B67;
	Tue, 12 Apr 2022 03:17:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3DBAC28110;
	Tue, 12 Apr 2022 03:17:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 222301940368;
	Tue, 12 Apr 2022 03:17:15 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E223C1947BBF for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 12 Apr 2022 03:17:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BC1A74022C6; Tue, 12 Apr 2022 03:17:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B86274021B0
 for <linux-cachefs@redhat.com>; Tue, 12 Apr 2022 03:17:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C9B43802AC3
 for <linux-cachefs@redhat.com>; Tue, 12 Apr 2022 03:17:13 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-HPY3E4F7OZ-pf_MDuI-4_w-1; Mon, 11 Apr 2022 23:17:11 -0400
X-MC-Unique: HPY3E4F7OZ-pf_MDuI-4_w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V9saviW_1649733421
Received: from 30.225.24.141(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V9saviW_1649733421) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 12 Apr 2022 11:17:03 +0800
Message-ID: <65116657-bf3f-94ae-9565-fa15b4ebcd83@linux.alibaba.com>
Date: Tue, 12 Apr 2022 11:17:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: David Howells <dhowells@redhat.com>
References: <20220406075612.60298-8-jefflexu@linux.alibaba.com>
 <20220406075612.60298-1-jefflexu@linux.alibaba.com>
 <1094292.1649684331@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <1094292.1649684331@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH v8 07/20] cachefiles: document on-demand
 read mode
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
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, fannaihao@baidu.com,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 tianzichen@kuaishou.com, joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
 bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi, thanks for such thorough and detailed reviewing and all these
corrections. I will fix them in the next version.


On 4/11/22 9:38 PM, David Howells wrote:
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
>> + (*) On-demand Read.
>> +
> 
> Unnecessary extra blank line.
> 
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
> What's the scope of the uniqueness of "id"?  Is it just unique to a particular
> cachefiles cache?

Yes. Currently each cache, I mean, each "struct cachefiles_cache",
maintains an xarray. The id is unique in the scope of the cache.


> 
>> +
>> +	struct cachefiles_close {
>> +		__u32 fd;
>> +	};
>> +
> 
> "where:"
> 
>> +	* ``fd`` identifies the anon_fd to be closed, which is exactly the same
> 
> "... which should be the same as that provided to the OPEN request".
> 
> Is it possible for userspace to move the fd around with dup() or whatever?

Currently No. The anon_fd is stored in

```
struct cachefiles_object {
	int fd;
	...
}
```

When sending READ/CLOSE request, the associated anon_fd is all fetched
from @fd field of struct cachefiles_object. dup() won't update @fd field
of struct cachefiles_object.

Thus when dup() is done, let's say there are fd A (original) and fd B
(duplicated from fd A) associated to the cachefiles_object. Then the @fd
field of following READ/CLOSE requests is always fd A, since @fd field
of struct cachefiles_object is not updated. However the CREAD (reply to
READ request) ioctl indeed can be done on either fd A or fd B.

Then when fd A is closed while fd B is still alive, @fd field of
following READ/CLOSE requests is still fd A, which is indeed buggy since
fd A can be reused then.

To fix this, I plan to replace @fd field of READ/CLOSE requests with
@object_id field.

```
struct cachefiles_close {
        __u32 object_id;
};


struct cachefiles_read {
        __u32 object_id;
        __u64 off;
        __u64 len;
};
```

Then each cachefiles_object has a unique object_id (in the scope of
cachefiles_cache). Each object_id can be mapped to multiple fds (1:N
mapping), while kernel only send an initial fd of this object_id through
OPEN request.

```
struct cachefiles_open {
	__u32 object_id;
        __u32 fd;
        __u32 volume_key_size;
        __u32 cookie_key_size;
        __u32 flags;
        __u8  data[];
};
```

The user daemon can modify the mapping through dup(), but it's
responsible for maintaining and updating this mapping. That is, the
mapping between object_id and all its associated fds should be
maintained in the user space.


>> +
>> +	struct cachefiles_read {
>> +		__u64 off;
>> +		__u64 len;
>> +		__u32 fd;
>> +	};
>> +
>> +	* ``off`` identifies the starting offset of the requested file range.
> 
> identifies -> indicates
> 
>> +
>> +	* ``len`` identifies the length of the requested file range.
>> +
> 
> identifies -> indicates (you could alternatively say "specified")
> 
>> +	* ``fd`` identifies the anonymous fd of the requested cache file. It is
>> +	  guaranteed that it shall be the same with
> 
> "same with" -> "same as"
> 
> Since the kernel cannot make such a guarantee, I think you may need to restate
> this as something like "Userspace must present the same fd as was given in the
> previous OPEN request".

Yes, whether the @fd field of READ request is same as that of OPEN
request or not, is actually implementation dependent. However as
described above, I'm going to change @fd field into @object_id field.
After that refactoring, the @object_id field of READ/CLOSE request
should be the same as the @object_id filed of CLOSE request.



>> +CACHEFILES_IOC_CREAD ioctl on the corresponding anon_fd::
>> +
>> +	ioctl(fd, CACHEFILES_IOC_CREAD, id);
>> +
>> +	* ``fd`` is exactly the fd field of the previous READ request.
> 
> Does that have to be true?  What if userspace moves it somewhere else?
> 

As described above, I'm going to change @fd field into @object_id field.
Then there is an @object_id filed in READ request. When replying the
READ request, the user daemon itself needs to get the corresponding
anon_fd of the given @object_id through the self-maintained mapping.


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

