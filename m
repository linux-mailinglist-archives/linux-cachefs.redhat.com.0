Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B53EA4B8840
	for <lists+linux-cachefs@lfdr.de>; Wed, 16 Feb 2022 13:55:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-rQL3ep6mOEGjNui7SB2K4g-1; Wed, 16 Feb 2022 07:55:02 -0500
X-MC-Unique: rQL3ep6mOEGjNui7SB2K4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FE5B2F44;
	Wed, 16 Feb 2022 12:55:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA0E16E207;
	Wed, 16 Feb 2022 12:54:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 700564BB7C;
	Wed, 16 Feb 2022 12:54:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21GCsqO3025952 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 07:54:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CD5851466C4B; Wed, 16 Feb 2022 12:54:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8D1B1466C47
	for <linux-cachefs@redhat.com>; Wed, 16 Feb 2022 12:54:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC000101CC60
	for <linux-cachefs@redhat.com>; Wed, 16 Feb 2022 12:54:52 +0000 (UTC)
Received: from out199-13.us.a.mail.aliyun.com
	(out199-13.us.a.mail.aliyun.com [47.90.199.13]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-140-7FrNQGWxOrSe7O8YgxJyhg-1; Wed, 16 Feb 2022 07:54:50 -0500
X-MC-Unique: 7FrNQGWxOrSe7O8YgxJyhg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
	TI=SMTPD_---0V4deDXW_1645015775
Received: from 30.225.24.51(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V4deDXW_1645015775) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 16 Feb 2022 20:49:36 +0800
Message-ID: <becd656c-701c-747e-f063-2b9867cbd3d2@linux.alibaba.com>
Date: Wed, 16 Feb 2022 20:49:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.6.0
To: Greg KH <gregkh@linuxfoundation.org>
References: <bd9cb3bb-e29c-d4b3-e9bf-915b9771b553@linux.alibaba.com>
	<20220215111335.123528-1-jefflexu@linux.alibaba.com>
	<YgzWkhXCnlNDADvb@kroah.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <YgzWkhXCnlNDADvb@kroah.com>
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
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, tao.peng@linux.alibaba.com,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	torvalds@linux-foundation.org, eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v4 05/23] cachefiles: introduce new
 devnode for on-demand read mode
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

Hi,

Thanks for reviewing. :)


On 2/16/22 6:48 PM, Greg KH wrote:
> On Tue, Feb 15, 2022 at 07:13:35PM +0800, Jeffle Xu wrote:
>> This patch introduces a new devnode 'cachefiles_ondemand' to support the
>> newly introduced on-demand read mode.
>>
>> The precondition for on-demand reading semantics is that, all blob files
>> have been placed under corresponding directory with correct file size
>> (sparse files) on the first beginning. When upper fs starts to access
>> the blob file, it will "cache miss" (hit the hole) and then turn to user
>> daemon for preparing the data.
>>
>> The interaction between kernel and user daemon is described as below.
>> 1. Once cache miss, .ondemand_read() callback of corresponding fscache
>>    backend is called to prepare the data. As for cachefiles, it just
>>    packages related metadata (file range to read, etc.) into a pending
>>    read request, and then the process triggering cache miss will fall
>>    asleep until the corresponding data gets fetched later.
>> 2. User daemon needs to poll on the devnode ('cachefiles_ondemand'),
>>    waiting for pending read request.
>> 3. Once there's pending read request, user daemon will be notified and
>>    shall read the devnode ('cachefiles_ondemand') to fetch one pending
>>    read request to process.
>> 4. For the fetched read request, user daemon need to somehow prepare the
>>    data (e.g. download from remote through network) and then write the
>>    fetched data into the backing file to fill the hole.
>> 5. After that, user daemon need to notify cachefiles backend by writing a
>>    'done' command to devnode ('cachefiles_ondemand'). It will also
>>    awake the previous asleep process triggering cache miss.
>> 6. By the time the process gets awaken, the data has been ready in the
>>    backing file. Then process can re-initiate a read request from the
>>    backing file.
>>
>> If user daemon exits in advance when upper fs still mounted, no new
>> on-demand read request can be queued anymore and the existing pending
>> read requests will fail with -EIO.
>>
>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>> ---
>>  fs/cachefiles/daemon.c                   | 185 +++++++++++++++++++++++
>>  fs/cachefiles/internal.h                 |  12 ++
>>  fs/cachefiles/io.c                       |  64 ++++++++
>>  fs/cachefiles/main.c                     |  27 ++++
>>  include/uapi/linux/cachefiles_ondemand.h |  14 ++
>>  5 files changed, 302 insertions(+)
>>  create mode 100644 include/uapi/linux/cachefiles_ondemand.h
>>
>> diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
>> index 6b8d7c5bbe5d..96aee8e0eb14 100644
>> --- a/fs/cachefiles/daemon.c
>> +++ b/fs/cachefiles/daemon.c
>> @@ -757,3 +757,188 @@ static void cachefiles_daemon_unbind(struct cachefiles_cache *cache)
>>  
>>  	_leave("");
>>  }
>> +
>> +#ifdef CONFIG_CACHEFILES_ONDEMAND
>> +static unsigned long cachefiles_open_ondemand;
>> +
>> +static int cachefiles_ondemand_open(struct inode *inode, struct file *file);
>> +static int cachefiles_ondemand_release(struct inode *inode, struct file *file);
>> +static ssize_t cachefiles_ondemand_write(struct file *, const char __user *,
>> +					 size_t, loff_t *);
>> +static ssize_t cachefiles_ondemand_read(struct file *, char __user *, size_t,
>> +					loff_t *);
>> +static __poll_t cachefiles_ondemand_poll(struct file *,
>> +					 struct poll_table_struct *);
>> +static int cachefiles_daemon_done(struct cachefiles_cache *, char *);
>> +
>> +const struct file_operations cachefiles_ondemand_fops = {
>> +	.owner		= THIS_MODULE,
>> +	.open		= cachefiles_ondemand_open,
>> +	.release	= cachefiles_ondemand_release,
>> +	.read		= cachefiles_ondemand_read,
>> +	.write		= cachefiles_ondemand_write,
>> +	.poll		= cachefiles_ondemand_poll,
>> +	.llseek		= noop_llseek,
>> +};
>> +
>> +static const struct cachefiles_daemon_cmd cachefiles_ondemand_cmds[] = {
>> +	{ "bind",	cachefiles_daemon_bind		},
>> +	{ "brun",	cachefiles_daemon_brun		},
>> +	{ "bcull",	cachefiles_daemon_bcull		},
>> +	{ "bstop",	cachefiles_daemon_bstop		},
>> +	{ "cull",	cachefiles_daemon_cull		},
>> +	{ "debug",	cachefiles_daemon_debug		},
>> +	{ "dir",	cachefiles_daemon_dir		},
>> +	{ "frun",	cachefiles_daemon_frun		},
>> +	{ "fcull",	cachefiles_daemon_fcull		},
>> +	{ "fstop",	cachefiles_daemon_fstop		},
>> +	{ "inuse",	cachefiles_daemon_inuse		},
>> +	{ "secctx",	cachefiles_daemon_secctx	},
>> +	{ "tag",	cachefiles_daemon_tag		},
>> +	{ "done",	cachefiles_daemon_done		},
>> +	{ "",		NULL				}
>> +};
>> +
>> +static int cachefiles_ondemand_open(struct inode *inode, struct file *file)
>> +{
>> +	struct cachefiles_cache *cache;
>> +
>> +	_enter("");
> 
> ftrace is your friend, no need to try to duplicate it with debugging
> stuff.  This and the _leave() calls should be removed.
> 
>> +
>> +	/* only the superuser may do this */
>> +	if (!capable(CAP_SYS_ADMIN))
>> +		return -EPERM;
> 
> Shouldn't you rely on the userspace permissions of the file instead of
> this?
> 

OK. You are right.


>> +
>> +	/* the cachefiles device may only be open once at a time */
>> +	if (xchg(&cachefiles_open_ondemand, 1) == 1)
>> +		return -EBUSY;
>> +
>> +	cache = cachefiles_daemon_open_cache();
>> +	if (!cache) {
>> +		cachefiles_open_ondemand = 0;
>> +		return -ENOMEM;
>> +	}
>> +
>> +	xa_init_flags(&cache->reqs, XA_FLAGS_ALLOC);
>> +	set_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags);
>> +
>> +	file->private_data = cache;
>> +	cache->cachefilesd = file;
>> +	return 0;
>> +}
>> +
>> +static void cachefiles_ondemand_flush_reqs(struct cachefiles_cache *cache)
>> +{
>> +	struct cachefiles_req *req;
>> +	unsigned long index;
>> +
>> +	xa_for_each(&cache->reqs, index, req) {
>> +		req->error = -EIO;
>> +		complete(&req->done);
>> +	}
>> +}
>> +
>> +static int cachefiles_ondemand_release(struct inode *inode, struct file *file)
>> +{
>> +	struct cachefiles_cache *cache = file->private_data;
>> +
>> +	_enter("");
>> +
>> +	ASSERT(cache);
> 
> We don't mess with ASSERT() in the kernel, how can this ever be false?
> 
>> +
>> +	set_bit(CACHEFILES_DEAD, &cache->flags);
>> +
>> +	cachefiles_ondemand_flush_reqs(cache);
>> +	cachefiles_daemon_unbind(cache);
>> +
>> +	/* clean up the control file interface */
>> +	xa_destroy(&cache->reqs);
>> +	cache->cachefilesd = NULL;
>> +	file->private_data = NULL;
>> +	cachefiles_open_ondemand = 0;
>> +
>> +	kfree(cache);
>> +
>> +	_leave("");
>> +	return 0;
>> +}
>> +
>> +static ssize_t cachefiles_ondemand_write(struct file *file,
>> +					 const char __user *_data,
>> +					 size_t datalen,
>> +					 loff_t *pos)
>> +{
>> +	return cachefiles_daemon_do_write(file, _data, datalen, pos,
>> +					  cachefiles_ondemand_cmds);
>> +}
>> +
>> +static ssize_t cachefiles_ondemand_read(struct file *file, char __user *_buffer,
>> +					size_t buflen, loff_t *pos)
>> +{
>> +	struct cachefiles_cache *cache = file->private_data;
>> +	struct cachefiles_req *req;
>> +	unsigned long id = 0;
>> +	int n;
>> +
>> +	if (!test_bit(CACHEFILES_READY, &cache->flags))
>> +		return 0;
>> +
>> +	req = xa_find(&cache->reqs, &id, UINT_MAX, XA_PRESENT);
>> +	if (!req)
>> +		return 0;
>> +
>> +	n = sizeof(struct cachefiles_req_in);
>> +	if (n > buflen)
		^
This statement is used to check if the user buffer is big enough to
contain the data. req->base is of 'struct cachefiles_req_in' type. But
it shall be better to be changed to

"n = sizeof(req->base);"

in case of type of req->base may be changed in the future.


>> +		return -EMSGSIZE;
> 
> You forgot to test if you have a big enough buffer to copy the data
> into :(



> 
>> +
>> +	req->base.id = id;
>> +	if (copy_to_user(_buffer, &req->base, n) != 0)
> 
> No endian issues?

'struct cachefiles_req_in' is always in the memory. It won't be flushed
to disk. So yes there's no endian issue.

> 
>> +		return -EFAULT;
>> +
>> +	return n;
>> +}
>> +
>> +static __poll_t cachefiles_ondemand_poll(struct file *file,
>> +					 struct poll_table_struct *poll)
>> +{
>> +	struct cachefiles_cache *cache = file->private_data;
>> +	__poll_t mask;
>> +
>> +	poll_wait(file, &cache->daemon_pollwq, poll);
>> +	mask = 0;
>> +
>> +	if (!xa_empty(&cache->reqs))
>> +		mask |= EPOLLIN;
>> +
>> +	return mask;
>> +}
>> +
>> +/*
>> + * Request completion
>> + * - command: "done <id>"
>> + */
>> +static int cachefiles_daemon_done(struct cachefiles_cache *cache, char *args)
>> +{
>> +	struct cachefiles_req *req;
>> +	unsigned long id;
>> +	int ret;
>> +
>> +	_enter(",%s", args);
>> +
>> +	if (!*args) {
>> +		pr_err("Empty id specified\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = kstrtoul(args, 0, &id);
>> +	if (ret)
>> +		return ret;
>> +
>> +	req = xa_erase(&cache->reqs, id);
>> +	if (!req)
>> +		return -EINVAL;
>> +
>> +	complete(&req->done);
>> +	return 0;
>> +}
>> +#endif
>> diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
>> index 6473634c41a9..59dd11e42cb3 100644
>> --- a/fs/cachefiles/internal.h
>> +++ b/fs/cachefiles/internal.h
>> @@ -15,6 +15,8 @@
>>  #include <linux/fscache-cache.h>
>>  #include <linux/cred.h>
>>  #include <linux/security.h>
>> +#include <linux/xarray.h>
>> +#include <linux/cachefiles_ondemand.h>
>>  
>>  #define CACHEFILES_DIO_BLOCK_SIZE 4096
>>  
>> @@ -102,6 +104,15 @@ struct cachefiles_cache {
>>  	char				*rootdirname;	/* name of cache root directory */
>>  	char				*secctx;	/* LSM security context */
>>  	char				*tag;		/* cache binding tag */
>> +#ifdef CONFIG_CACHEFILES_ONDEMAND
>> +	struct xarray			reqs;
>> +#endif
>> +};
>> +
>> +struct cachefiles_req {
>> +	struct cachefiles_req_in base;
>> +	struct completion done;
>> +	int error;
>>  };
>>  
>>  #include <trace/events/cachefiles.h>
>> @@ -146,6 +157,7 @@ extern int cachefiles_has_space(struct cachefiles_cache *cache,
>>   * daemon.c
>>   */
>>  extern const struct file_operations cachefiles_daemon_fops;
>> +extern const struct file_operations cachefiles_ondemand_fops;
>>  
>>  /*
>>   * error_inject.c
>> diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
>> index 753986ea1583..7c51e53d52d1 100644
>> --- a/fs/cachefiles/io.c
>> +++ b/fs/cachefiles/io.c
>> @@ -597,6 +597,67 @@ static void cachefiles_end_operation(struct netfs_cache_resources *cres)
>>  	fscache_end_cookie_access(fscache_cres_cookie(cres), fscache_access_io_end);
>>  }
>>  
>> +#ifdef CONFIG_CACHEFILES_ONDEMAND
>> +static struct cachefiles_req *cachefiles_alloc_req(struct cachefiles_object *object,
>> +						   loff_t start_pos,
>> +						   size_t len)
>> +{
>> +	struct cachefiles_req *req;
>> +	struct cachefiles_req_in *base;
>> +
>> +	req = kzalloc(sizeof(*req), GFP_KERNEL);
>> +	if (!req)
>> +		return NULL;
>> +
>> +	base = &req->base;
>> +
>> +	base->off = start_pos;
>> +	base->len = len;
>> +	strncpy(base->path, object->d_name, sizeof(base->path) - 1);
>> +
>> +	init_completion(&req->done);
>> +
>> +	return req;
>> +}
>> +
>> +static int cachefiles_ondemand_read(struct netfs_cache_resources *cres,
>> +				    loff_t start_pos, size_t len)
>> +{
>> +	struct cachefiles_object *object;
>> +	struct cachefiles_cache *cache;
>> +	struct cachefiles_req *req;
>> +	int ret;
>> +	u32 id;
>> +
>> +	object = cachefiles_cres_object(cres);
>> +	cache = object->volume->cache;
>> +
>> +	if (!test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (test_bit(CACHEFILES_DEAD, &cache->flags))
>> +		return -EIO;
>> +
>> +	req = cachefiles_alloc_req(object, start_pos, len);
>> +	if (!req)
>> +		return -ENOMEM;
>> +
>> +	ret = xa_alloc(&cache->reqs, &id, req, xa_limit_32b, GFP_KERNEL);
>> +	if (ret) {
>> +		kfree(req);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	wake_up_all(&cache->daemon_pollwq);
>> +
>> +	wait_for_completion(&req->done);
>> +	ret = req->error;
>> +	kfree(req);
>> +
>> +	return ret;
>> +}
>> +#endif
>> +
>>  static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
>>  	.end_operation		= cachefiles_end_operation,
>>  	.read			= cachefiles_read,
>> @@ -604,6 +665,9 @@ static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
>>  	.prepare_read		= cachefiles_prepare_read,
>>  	.prepare_write		= cachefiles_prepare_write,
>>  	.query_occupancy	= cachefiles_query_occupancy,
>> +#ifdef CONFIG_CACHEFILES_ONDEMAND
>> +	.ondemand_read		= cachefiles_ondemand_read,
>> +#endif
>>  };
>>  
>>  /*
>> diff --git a/fs/cachefiles/main.c b/fs/cachefiles/main.c
>> index 3f369c6f816d..eab17c3140d9 100644
>> --- a/fs/cachefiles/main.c
>> +++ b/fs/cachefiles/main.c
>> @@ -39,6 +39,27 @@ static struct miscdevice cachefiles_dev = {
>>  	.fops	= &cachefiles_daemon_fops,
>>  };
>>  
>> +#ifdef CONFIG_CACHEFILES_ONDEMAND
>> +static struct miscdevice cachefiles_ondemand_dev = {
>> +	.minor	= MISC_DYNAMIC_MINOR,
>> +	.name	= "cachefiles_ondemand",
> 
> That is a very big device node name.  Are you sure that is what you
> want?

I have to admit that it's not a good name. I need to think of a better
name...

> 
> And where are you documenting this new misc device node name and format
> so that userspace knows about it?

Sorry I haven't documented all these. Indeed we need a better documentation.

> 
>> +	.fops	= &cachefiles_ondemand_fops,
>> +};
>> +
>> +static inline int cachefiles_init_ondemand(void)
>> +{
>> +	return misc_register(&cachefiles_ondemand_dev);
>> +}
>> +
>> +static inline void cachefiles_exit_ondemand(void)
>> +{
>> +	misc_deregister(&cachefiles_ondemand_dev);
>> +}
>> +#else
>> +static inline int cachefiles_init_ondemand(void) { return 0; }
>> +static inline void cachefiles_exit_ondemand(void) {}
>> +#endif
>> +
>>  /*
>>   * initialise the fs caching module
>>   */
>> @@ -52,6 +73,9 @@ static int __init cachefiles_init(void)
>>  	ret = misc_register(&cachefiles_dev);
>>  	if (ret < 0)
>>  		goto error_dev;
>> +	ret = cachefiles_init_ondemand();
>> +	if (ret < 0)
>> +		goto error_ondemand_dev;
>>  
>>  	/* create an object jar */
>>  	ret = -ENOMEM;
>> @@ -68,6 +92,8 @@ static int __init cachefiles_init(void)
>>  	return 0;
>>  
>>  error_object_jar:
>> +	cachefiles_exit_ondemand();
>> +error_ondemand_dev:
>>  	misc_deregister(&cachefiles_dev);
>>  error_dev:
>>  	cachefiles_unregister_error_injection();
>> @@ -86,6 +112,7 @@ static void __exit cachefiles_exit(void)
>>  	pr_info("Unloading\n");
>>  
>>  	kmem_cache_destroy(cachefiles_object_jar);
>> +	cachefiles_exit_ondemand();
>>  	misc_deregister(&cachefiles_dev);
>>  	cachefiles_unregister_error_injection();
>>  }
>> diff --git a/include/uapi/linux/cachefiles_ondemand.h b/include/uapi/linux/cachefiles_ondemand.h
>> new file mode 100644
>> index 000000000000..e639a82f1098
>> --- /dev/null
>> +++ b/include/uapi/linux/cachefiles_ondemand.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +#ifndef _LINUX_CACHEFILES_ONDEMAND_H
>> +#define _LINUX_CACHEFILES_ONDEMAND_H
>> +
>> +#include <linux/limits.h>
>> +
>> +struct cachefiles_req_in {
>> +	uint64_t id;
>> +	uint64_t off;
>> +	uint64_t len;
> 
> For structures that cross the user/kernel boundry, you have to use the
> correct types.  For this it would be __u64.

OK I will change to __xx style in the next version.

By the way, I can't understand the disadvantage of uintxx_t style. I can
only find the inital commit [1] that introduces the __xx style. But
still I can't get any background info.

[1] commit d13ff31cfeedbf2fefc7ba13cb753775648eac0c ("types: create
<asm-generic/int-*.h>")

> 
>> +	char path[NAME_MAX];
> 
> __u8.
> 
> Also, what is the endian of the other values here?  Always native?

As stated previously, these structures are always in memory, and thus
there's no endian issue.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

