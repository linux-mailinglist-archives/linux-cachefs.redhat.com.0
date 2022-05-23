Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC679530714
	for <lists+linux-cachefs@lfdr.de>; Mon, 23 May 2022 03:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653268901;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RjXDNGtyy5WCJy4uOvIeBxT+OwyhCz/ToLiMenfVzCQ=;
	b=EpB8AEWRHIyl7i8quoy4hQXkgVjDPWFuwKDMkiN54Op+P76hhE+7cAG7DIGSWc37zKO14/
	p+IDOYvyNvtB+/L1K1svJ2kKLrhtpZX2Uo0WMoGEmCeUJhrkK00kzlW2qb5G9fRhVDaZsL
	FP4AVD2ApgeFcr21j5xy/CWfPYV+D+M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-Wvx0i5bCM36Mxc9aZYYKfQ-1; Sun, 22 May 2022 21:21:38 -0400
X-MC-Unique: Wvx0i5bCM36Mxc9aZYYKfQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0885385A5BB;
	Mon, 23 May 2022 01:21:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5350C28101;
	Mon, 23 May 2022 01:21:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4767F194705C;
	Mon, 23 May 2022 01:21:35 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E24B41947059 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 23 May 2022 01:21:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C38082166B2D; Mon, 23 May 2022 01:21:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF3672166B25
 for <linux-cachefs@redhat.com>; Mon, 23 May 2022 01:21:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2FAB3C0ED64
 for <linux-cachefs@redhat.com>; Mon, 23 May 2022 01:21:34 +0000 (UTC)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-8xbhKb0IPmuQdKEEak_TmQ-1; Sun, 22 May 2022 21:21:33 -0400
X-MC-Unique: 8xbhKb0IPmuQdKEEak_TmQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 b20-20020a62a114000000b0050a6280e374so5407972pff.13
 for <linux-cachefs@redhat.com>; Sun, 22 May 2022 18:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QeksuAmJWYaEi0TQFOkREQ3m4yGhTUgNwHT42YPdtQw=;
 b=cuo1W7QNb/JdL6My5Q7t7oY+htpbNZRF7Hin1plhmCzdWjmfS9S0sZ5M9zxFGh3d0D
 N7EVWy5MV+uPJefV0Z1+Rn/hVyVweM/TbB8Z8yj+XImtCs13GZidpqLA90ntHEC4LhrV
 qkL/eFUO97CELcSas8zR4CnbHBQ+AUMlogFB4Vlidzve6viAHYxMWl7JoMlkUHVWZg6m
 f9qytYOXJoiXf8H5T4zq+N2X/MyEhMVDVd2NdJ8sK19IO+2wlyShaFQeO17Q4VleMDZi
 VDKa3vsLd6RHtC5Hx1X1AWzmd7ZtPUzYXqQDIBOdCRcpF7Cv3FnmmioJThE60XREW70J
 3Q1g==
X-Gm-Message-State: AOAM533KxhXNYQAAG1BhzBMQQpT1J0lGaOvTf9py0bt+/7sD9+cED4gz
 iv4lAt0AG4TIlmFYX3D1LECha+Scevr5gIumMlxvIf0y4YobUo1aTFO2vaEYyl89445uF5nGMQP
 bkHYtcEL2B7gR+OzeS7oX7g==
X-Received: by 2002:a17:90a:d903:b0:1df:a0da:20f0 with SMTP id
 c3-20020a17090ad90300b001dfa0da20f0mr23423503pjv.182.1653268892049; 
 Sun, 22 May 2022 18:21:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNU9E4cxJdDWjM4BXDRtnTqV2SL+V24TO114v2WBtj4cxB6iy5/XCHNte78zG0bsganOQmLw==
X-Received: by 2002:a17:90a:d903:b0:1df:a0da:20f0 with SMTP id
 c3-20020a17090ad90300b001dfa0da20f0mr23423486pjv.182.1653268891813; 
 Sun, 22 May 2022 18:21:31 -0700 (PDT)
Received: from [10.72.12.81] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a170902710f00b0015e8d4eb283sm3677403pll.205.2022.05.22.18.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 18:21:31 -0700 (PDT)
To: Jeff Layton <jlayton@kernel.org>, David Howells <dhowells@redhat.com>
References: <165296980082.3595490.3561111064004493810.stgit@warthog.procyon.org.uk>
 <e5f6fee5518ce8e1b4fc5aa7038de1617a341c2f.camel@kernel.org>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <72a1cb54-4632-659d-e6ec-2d754ab2fc28@redhat.com>
Date: Mon, 23 May 2022 09:21:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e5f6fee5518ce8e1b4fc5aa7038de1617a341c2f.camel@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH 1/2] netfs: ->cleanup() op is always
 given a rreq pointer now
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
Cc: linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 5/19/22 11:36 PM, Jeff Layton wrote:
> On Thu, 2022-05-19 at 15:16 +0100, David Howells wrote:
>> As the ->init() netfs op is now used to set up the netfslib I/O request
>> rather than passing stuff in, thereby allowing the netfslib functions to be
>> pointed at directly by the address_space_operations struct, we're always
>> going to be able to pass an I/O request pointer to the cleanup function.
>>
>> Therefore, change the ->cleanup() function to take a pointer to the I/O
>> request rather than taking a pointer to the network filesystem's
>> address_space and a piece of private data.
>>
>> Also, rename ->cleanup() to ->free_request() to match the ->init_request()
>> function.
>>
>> Signed-off-by: David Howells <dhowells@redhat.com>
>> cc: Jeff Layton <jlayton@kernel.org>
>> cc: Steve French <sfrench@samba.org>
>> cc: Dominique Martinet <asmadeus@codewreck.org>
>> cc: Jeff Layton <jlayton@redhat.com>
>> cc: David Wysochanski <dwysocha@redhat.com>
>> cc: Ilya Dryomov <idryomov@gmail.com>
>> cc: v9fs-developer@lists.sourceforge.net
>> cc: ceph-devel@vger.kernel.org
>> cc: linux-afs@lists.infradead.org
>> cc: linux-cifs@vger.kernel.org
>> cc: linux-cachefs@redhat.com
>> cc: linux-fsdevel@vger.kernel.org
>> ---
>>
>>   fs/9p/vfs_addr.c      |   11 +++++------
>>   fs/afs/file.c         |    6 +++---
>>   fs/ceph/addr.c        |    9 ++++-----
>>   fs/netfs/objects.c    |    8 +++++---
>>   include/linux/netfs.h |    4 +++-
>>   5 files changed, 20 insertions(+), 18 deletions(-)
>>
>> diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
>> index 501128188343..002c482794dc 100644
>> --- a/fs/9p/vfs_addr.c
>> +++ b/fs/9p/vfs_addr.c
>> @@ -66,13 +66,12 @@ static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
>>   }
>>   
>>   /**
>> - * v9fs_req_cleanup - Cleanup request initialized by v9fs_init_request
>> - * @mapping: unused mapping of request to cleanup
>> - * @priv: private data to cleanup, a fid, guaranted non-null.
>> + * v9fs_free_request - Cleanup request initialized by v9fs_init_rreq
>> + * @rreq: The I/O request to clean up
>>    */
>> -static void v9fs_req_cleanup(struct address_space *mapping, void *priv)
>> +static void v9fs_free_request(struct netfs_io_request *rreq)
>>   {
>> -	struct p9_fid *fid = priv;
>> +	struct p9_fid *fid = rreq->netfs_priv;
>>   
>>   	p9_client_clunk(fid);
>>   }
>> @@ -94,9 +93,9 @@ static int v9fs_begin_cache_operation(struct netfs_io_request *rreq)
>>   
>>   const struct netfs_request_ops v9fs_req_ops = {
>>   	.init_request		= v9fs_init_request,
>> +	.free_request		= v9fs_free_request,
>>   	.begin_cache_operation	= v9fs_begin_cache_operation,
>>   	.issue_read		= v9fs_issue_read,
>> -	.cleanup		= v9fs_req_cleanup,
>>   };
>>   
>>   /**
>> diff --git a/fs/afs/file.c b/fs/afs/file.c
>> index 26292a110a8f..b9ca72fbbcf9 100644
>> --- a/fs/afs/file.c
>> +++ b/fs/afs/file.c
>> @@ -383,17 +383,17 @@ static int afs_check_write_begin(struct file *file, loff_t pos, unsigned len,
>>   	return test_bit(AFS_VNODE_DELETED, &vnode->flags) ? -ESTALE : 0;
>>   }
>>   
>> -static void afs_priv_cleanup(struct address_space *mapping, void *netfs_priv)
>> +static void afs_free_request(struct netfs_io_request *rreq)
>>   {
>> -	key_put(netfs_priv);
>> +	key_put(rreq->netfs_priv);
>>   }
>>   
>>   const struct netfs_request_ops afs_req_ops = {
>>   	.init_request		= afs_init_request,
>> +	.free_request		= afs_free_request,
>>   	.begin_cache_operation	= afs_begin_cache_operation,
>>   	.check_write_begin	= afs_check_write_begin,
>>   	.issue_read		= afs_issue_read,
>> -	.cleanup		= afs_priv_cleanup,
>>   };
>>   
>>   int afs_write_inode(struct inode *inode, struct writeback_control *wbc)
>> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
>> index b6edcf89a429..ee8c1b099c4f 100644
>> --- a/fs/ceph/addr.c
>> +++ b/fs/ceph/addr.c
>> @@ -392,11 +392,10 @@ static int ceph_init_request(struct netfs_io_request *rreq, struct file *file)
>>   	return 0;
>>   }
>>   
>> -static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
>> +static void ceph_netfs_free_request(struct netfs_io_request *rreq)
>>   {
>> -	struct inode *inode = mapping->host;
>> -	struct ceph_inode_info *ci = ceph_inode(inode);
>> -	int got = (uintptr_t)priv;
>> +	struct ceph_inode_info *ci = ceph_inode(rreq->inode);
>> +	int got = (uintptr_t)rreq->netfs_priv;
>>   
>>   	if (got)
>>   		ceph_put_cap_refs(ci, got);
>> @@ -404,12 +403,12 @@ static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
>>   
>>   const struct netfs_request_ops ceph_netfs_ops = {
>>   	.init_request		= ceph_init_request,
>> +	.free_request		= ceph_netfs_free_request,
>>   	.begin_cache_operation	= ceph_begin_cache_operation,
>>   	.issue_read		= ceph_netfs_issue_read,
>>   	.expand_readahead	= ceph_netfs_expand_readahead,
>>   	.clamp_length		= ceph_netfs_clamp_length,
>>   	.check_write_begin	= ceph_netfs_check_write_begin,
>> -	.cleanup		= ceph_readahead_cleanup,
>>   };
>>   
>>   #ifdef CONFIG_CEPH_FSCACHE
>> diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
>> index e86107b30ba4..d6b8c0cbeb7c 100644
>> --- a/fs/netfs/objects.c
>> +++ b/fs/netfs/objects.c
>> @@ -75,10 +75,10 @@ static void netfs_free_request(struct work_struct *work)
>>   	struct netfs_io_request *rreq =
>>   		container_of(work, struct netfs_io_request, work);
>>   
>> -	netfs_clear_subrequests(rreq, false);
>> -	if (rreq->netfs_priv)
>> -		rreq->netfs_ops->cleanup(rreq->mapping, rreq->netfs_priv);
>>   	trace_netfs_rreq(rreq, netfs_rreq_trace_free);
>> +	netfs_clear_subrequests(rreq, false);
>> +	if (rreq->netfs_ops->free_request)
>> +		rreq->netfs_ops->free_request(rreq);
>>   	if (rreq->cache_resources.ops)
>>   		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
>>   	kfree(rreq);
>> @@ -140,6 +140,8 @@ static void netfs_free_subrequest(struct netfs_io_subrequest *subreq,
>>   	struct netfs_io_request *rreq = subreq->rreq;
>>   
>>   	trace_netfs_sreq(subreq, netfs_sreq_trace_free);
>> +	if (rreq->netfs_ops->free_subrequest)
>> +		rreq->netfs_ops->free_subrequest(subreq);
>>   	kfree(subreq);
>>   	netfs_stat_d(&netfs_n_rh_sreq);
>>   	netfs_put_request(rreq, was_async, netfs_rreq_trace_put_subreq);
>> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
>> index c7bf1eaf51d5..1970c21b4f80 100644
>> --- a/include/linux/netfs.h
>> +++ b/include/linux/netfs.h
>> @@ -204,7 +204,10 @@ struct netfs_io_request {
>>    */
>>   struct netfs_request_ops {
>>   	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
>> +	void (*free_request)(struct netfs_io_request *rreq);
>> +	void (*free_subrequest)(struct netfs_io_subrequest *rreq);
> Do we need free_subrequest? It looks like nothing defines it in this
> series.

If this is needed in future, or shall we do this in 
netfs_clear_subrequests() ?

-- Xiubo

>>   	int (*begin_cache_operation)(struct netfs_io_request *rreq);
>> +
>>   	void (*expand_readahead)(struct netfs_io_request *rreq);
>>   	bool (*clamp_length)(struct netfs_io_subrequest *subreq);
>>   	void (*issue_read)(struct netfs_io_subrequest *subreq);
>> @@ -212,7 +215,6 @@ struct netfs_request_ops {
>>   	int (*check_write_begin)(struct file *file, loff_t pos, unsigned len,
>>   				 struct folio *folio, void **_fsdata);
>>   	void (*done)(struct netfs_io_request *rreq);
>> -	void (*cleanup)(struct address_space *mapping, void *netfs_priv);
>>   };
>>   
>>   /*
>>
>>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

