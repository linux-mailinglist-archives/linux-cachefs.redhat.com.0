Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D3D4FBD59
	for <lists+linux-cachefs@lfdr.de>; Mon, 11 Apr 2022 15:39:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649684343;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9v1KniQe7qqM3Ap4D18oGsxFJg9ixAEhWnUlM0avi1s=;
	b=ScIajaSmsyTAjD11crMjBVL9987hYyejAsjSmh0IrgyC8gMlsqdqMDpy2k6IDVKWbycQk5
	P+aM1ghXJ1LLkhAZkpq7gAONgxusbx3d7/0ABwRMsDB0m0obEDqIn0x43PzC50nX+1zYRt
	7cnYwimBIX8HtynP3Gz+ptQV3/3xTUg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-JHOPjAqdNeSSeygIhbGffA-1; Mon, 11 Apr 2022 09:39:02 -0400
X-MC-Unique: JHOPjAqdNeSSeygIhbGffA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BCA21C0BF89;
	Mon, 11 Apr 2022 13:39:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA4EB1415125;
	Mon, 11 Apr 2022 13:38:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 669841947BBB;
	Mon, 11 Apr 2022 13:38:56 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 89D3F19466DF for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 11 Apr 2022 13:38:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7AD2BC44CCE; Mon, 11 Apr 2022 13:38:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6991C15D40;
 Mon, 11 Apr 2022 13:38:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220406075612.60298-8-jefflexu@linux.alibaba.com>
References: <20220406075612.60298-8-jefflexu@linux.alibaba.com>
 <20220406075612.60298-1-jefflexu@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Mon, 11 Apr 2022 14:38:51 +0100
Message-ID: <1094292.1649684331@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: tianzichen@kuaishou.com, linux-erofs@lists.ozlabs.org, chao@kernel.org,
 fannaihao@baidu.com, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1094291.1649684331.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> + (*) On-demand Read.
> +

Unnecessary extra blank line.

Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> +
> +
> +On-demand Read
> +==============
> +
> +When working in original mode, cachefiles mainly serves as a local cache for
> +remote networking fs, while in on-demand read mode, cachefiles can boost the
> +scenario where on-demand read semantics is needed, e.g. container image
> +distribution.
> +
> +The essential difference between these two modes is that, in original mode,
> +when cache miss, netfs itself will fetch data from remote, and then write the
> +fetched data into cache file. While in on-demand read mode, a user daemon is
> +responsible for fetching data and then writing to the cache file.
> +
> +``CONFIG_CACHEFILES_ONDEMAND`` shall be enabled to support on-demand read mode.

You're missing a few articles there.  How about:

"""
When working in its original mode, cachefiles mainly serves as a local cache
for a remote networking fs - while in on-demand read mode, cachefiles can boost
the scenario where on-demand read semantics are needed, e.g. container image
distribution.

The essential difference between these two modes is that, in original mode,
when a cache miss occurs, the netfs will fetch the data from the remote server
and then write it to the cache file.  With on-demand read mode, however,
fetching and the data and writing it into the cache is delegated to a user
daemon.

``CONFIG_CACHEFILES_ONDEMAND`` shall be enabled to support on-demand read mode.
"""

"should be enabled".

Also, two spaces after a full stop please (but not after the dot in a
contraction, e.g. "e.g.").

> +The on-demand read mode relies on a simple protocol used for communication
> +between kernel and user daemon. The model is like::

"The protocol can be modelled as"?

> +The cachefiles kernel module will send requests to

the

> user daemon when needed.
> +

the

> User daemon needs to poll on the devnode ('/dev/cachefiles') to check if
> +there's

a

> pending request to be processed.  A POLLIN event will be returned
> +when there's

a

> pending request.

> +Then user daemon needs to read

"The user daemon [than] reads "

> the devnode to fetch one

one -> a

> request and process it
> +accordingly. It is worth nothing

nothing -> noting

> that each read only gets one request. When
> +finished processing the request,

the

> user daemon needs to write the reply to the
> +devnode.

> +Each request is started with a message header like::

"is started with" -> "starts with".
"like" -> "of the form".

> +	* ``id`` is a unique ID identifying this request among all pending
> +	  requests.

What's the scope of the uniqueness of "id"?  Is it just unique to a particular
cachefiles cache?

> +	* ``len`` identifies the whole length of this request, including the
> +	  header and following type specific payload.

type-specific.

> +An optional parameter is added to "bind" command::

to the "bind" command.

> +When

the

> "bind" command takes

takes -> is given

> without argument, it defaults to the original mode.
> +When

the

> "bind" command takes

is given

> with

the

> "ondemand" argument, i.e. "bind ondemand",
> +on-demand read mode will be enabled.

> +OPEN Request

The

> +------------
> +
> +When

the

> netfs opens a cache file for the first time, a request with

the

> +CACHEFILES_OP_OPEN opcode, a.k.a

an

> OPEN request will be sent to

the

> user daemon. The
> +payload format is like::

format is like -> of the form

> +
> +	struct cachefiles_open {
> +		__u32 volume_key_size;
> +		__u32 cookie_key_size;
> +		__u32 fd;
> +		__u32 flags;
> +		__u8  data[];
> +	};
> +

"where:"

> +	* ``data`` contains

the

> volume_key and cookie_key in sequence.

Might be better to say "contains the volume_key followed directly by the
cookie_key.  The volume key is a NUL-terminated string; cookie_key is binary
data.".

> +
> +	* ``volume_key_size`` identifies

identifies -> indicates/supplies

> the size of

the

> volume key of the cache
> +	  file, in bytes. volume_key is of string format, with a suffix '\0'.
> +
> +	* ``cookie_key_size`` identifies the size of cookie key of the cache
> +	  file, in bytes. cookie_key is of binary format, which is netfs
> +	  specific.

"... indicates the size of the cookie key in bytes."

> +
> +	* ``fd`` identifies the

the -> an

> anonymous fd of

of -> referring to

> the cache file, with

with -> through

> which user
> +	  daemon can perform write/llseek file operations on the cache file.
> +
> +
> +

The

> OPEN request contains

a

> (volume_key, cookie_key, anon_fd) triple for

triplet for the

I would probably also use {...} rather than (...).

> corresponding
> +cache file. With this triple,

triplet, the

> user daemon could

could -> can

> fetch and write data into the
> +cache file in the background, even when kernel has not triggered the

the -> a

> cache miss
> +yet.

The

> User daemon is able to distinguish the requested cache file with the given
> +(volume_key, cookie_key), and write the fetched data into

the

> cache file with

with -> using

> the
> +given anon_fd.
> +
> +After recording the (volume_key, cookie_key, anon_fd) triple,

triplet, the

> user daemon shall

shall -> should

> +reply with

reply with -> complete the request by issuing a

> "copen" (complete open) command::
> +
> +	copen <id>,<cache_size>
> +
> +	* ``id`` is exactly the id field of the previous OPEN request.
> +
> +	* When >= 0, ``cache_size`` identifies the size of the cache file;
> +	  when < 0, ``cache_size`` identifies the error code ecountered by the
> +	  user daemon.

identifies -> indicates
ecountered -> encountered

> +CLOSE Request

The

> +-------------
> +When

a

> cookie withdrawed,

withdrawed -> withdrawn

> a request with

a

> CACHEFILES_OP_CLOSE opcode, a.k.a CLOSE
> +request,

Maybe phrase as "... a close request (opcode CACHEFILES_OP_CLOSE),

> will be sent to user daemon. It will notify

the

> user daemon to close the
> +attached anon_fd. The payload format is like::

like -> of the form

> +
> +	struct cachefiles_close {
> +		__u32 fd;
> +	};
> +

"where:"

> +	* ``fd`` identifies the anon_fd to be closed, which is exactly the same

"... which should be the same as that provided to the OPEN request".

Is it possible for userspace to move the fd around with dup() or whatever?

> +	  with that in OPEN request.
> +
> +
> +READ Request

The

> +------------
> +
> +When on-demand read mode is turned on, and

a

> cache miss encountered,

the

> kernel will
> +send a request with CACHEFILES_OP_READ opcode, a.k.a READ request,

"send a READ request (opcode CACHEFILES_OP_READ)"

> to

the

> user
> +daemon. It will notify

It will notify -> This will ask/tell

> user daemon to fetch data in the requested file range.
> +The payload format is like::

format is like -> is of the form

> +
> +	struct cachefiles_read {
> +		__u64 off;
> +		__u64 len;
> +		__u32 fd;
> +	};
> +
> +	* ``off`` identifies the starting offset of the requested file range.

identifies -> indicates

> +
> +	* ``len`` identifies the length of the requested file range.
> +

identifies -> indicates (you could alternatively say "specified")

> +	* ``fd`` identifies the anonymous fd of the requested cache file. It is
> +	  guaranteed that it shall be the same with

"same with" -> "same as"

Since the kernel cannot make such a guarantee, I think you may need to restate
this as something like "Userspace must present the same fd as was given in the
previous OPEN request".

> the fd field in the previous
> +	  OPEN request.
> +
> +When receiving one

one -> a

> READ request,

the

> user daemon needs to fetch

the

> data of the
> +requested file range, and then write the fetched data

, and then write the fetched data -> and write it

> into cache file

cache file -> cache

> with

using

> the
> +given anonymous fd.

+ to indicate the destination.

> +
> +When finished

When finished -> To finish

> processing the READ request,

the

> user daemon needs to reply with

the

> +CACHEFILES_IOC_CREAD ioctl on the corresponding anon_fd::
> +
> +	ioctl(fd, CACHEFILES_IOC_CREAD, id);
> +
> +	* ``fd`` is exactly the fd field of the previous READ request.

Does that have to be true?  What if userspace moves it somewhere else?

> +
> +	* ``id`` is exactly the id field of the previous READ request.

is exactly the -> must match the

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

