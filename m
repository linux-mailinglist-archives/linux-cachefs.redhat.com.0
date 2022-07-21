Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4B357FD15
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jul 2022 12:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658743791;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mCIA5pJVYdWItrQBiakiG8T0xqmbIHE6e1l82+D1KvM=;
	b=aEFckB9TstZgBaVoKYdaNIRaRvGNy5qa2QGn4JNBbQEGsw/0G0rYf17lkjXSKD4L64YcYs
	8SbLV3kbItCmb0VGc2MTdhuipKQ9eTxXREXI7DUVJSj82AD2tRn+Ai8uUVSK8nDW2zxQFQ
	oWzFgzyWQhsvE4sV5ETHpT2lViOaE8Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-hhXPVjR2O8qtRjjL7UJV1A-1; Mon, 25 Jul 2022 06:09:48 -0400
X-MC-Unique: hhXPVjR2O8qtRjjL7UJV1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CDDF3810796;
	Mon, 25 Jul 2022 10:09:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15E471121319;
	Mon, 25 Jul 2022 10:09:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2DEB21945D9E;
	Mon, 25 Jul 2022 10:09:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0BDEE1947051 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 21 Jul 2022 03:58:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DE023400E894; Thu, 21 Jul 2022 03:58:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8A3F404C6C0
 for <linux-cachefs@redhat.com>; Thu, 21 Jul 2022 03:58:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCCB7802D1C
 for <linux-cachefs@redhat.com>; Thu, 21 Jul 2022 03:58:33 +0000 (UTC)
Received: from m13114.mail.163.com (m13114.mail.163.com [220.181.13.114]) by
 relay.mimecast.com with ESMTP id us-mta-392-K6D4N8-ONYmOWal2xSE_bg-1; Wed,
 20 Jul 2022 23:58:14 -0400
X-MC-Unique: K6D4N8-ONYmOWal2xSE_bg-1
Received: from slark_xiao$163.com ( [112.97.57.47] ) by
 ajax-webmail-wmsvr114 (Coremail) ; Thu, 21 Jul 2022 11:55:22 +0800 (CST)
X-Originating-IP: [112.97.57.47]
Date: Thu, 21 Jul 2022 11:55:22 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: James <xdragon007@gmail.com>
X-Priority: 3
In-Reply-To: <CAHreTZ5JWmQDiaO92e=yvdwv_fFmuZFksaf06K3Ux8_bAHFrUQ@mail.gmail.com>
References: <20220721015605.20651-1-slark_xiao@163.com>
 <Yti+xEJIWeTSqD8n@MiWiFi-R3L-srv>
 <CAHreTZ5JWmQDiaO92e=yvdwv_fFmuZFksaf06K3Ux8_bAHFrUQ@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <5b6b7ed5.173d.1821ee55452.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: csGowADH_9IqzthiUZMjAA--.59423W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbBDQtFZFaEKAs9ngACs3
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Mon, 25 Jul 2022 10:09:45 +0000
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [Linux-cachefs] [PATCH v2] docs: Fix typo in comment
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
Cc: linux-cachefs@redhat.com, linux-doc@vger.kernel.org, peterz@infradead.org,
 bigeasy@linutronix.de, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 will@kernel.org, Baoquan He <bhe@redhat.com>, corbet@lwn.net,
 william.gray@linaro.org, John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, mingo@redhat.com, longman@redhat.com,
 dyoung@redhat.com, vgoyal@redhat.com, boqun.feng@gmail.com,
 KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>, tglx@linutronix.de,
 Hao Luo <haoluo@google.com>, Daniel Borkmann <daniel@iogearbox.net>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Olsa <jolsa@kernel.org>, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi James,
  Thanks for your advice as well.
   I thought people would check the changes directly to double check the difference between '---' and '+++'.
   Anyway, I shall add a sumarization for this changes to reduce confusion. Apologize for that!

















At 2022-07-21 11:26:42, "James" <xdragon007@gmail.com> wrote:

Please read the Dev doc. You need to give describe about what you have done in the commit message. Your words are too general.
Regarding the typos, these are just words, you may list the changes in the message so that people can get it easily. Or summarise it.



Anyway this is good to me.


On Thu, Jul 21, 2022 at 11:09 AM Baoquan He <bhe@redhat.com> wrote:

On 07/21/22 at 09:56am, Slark Xiao wrote:
> Fix typo in the comment

Better tell what's fixed to save reviewers' time:

Fix typo 'the the' in several places of document.

Other then this nitpick, looks good to me.

Reviewed-by: Baoquan He <bhe@redhat.com>

>
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
> v2: Add all .rst changes in Documents into 1 single patch
> ---
>  Documentation/admin-guide/kdump/vmcoreinfo.rst    | 2 +-
>  Documentation/bpf/map_cgroup_storage.rst          | 4 ++--
>  Documentation/core-api/cpu_hotplug.rst            | 2 +-
>  Documentation/driver-api/isa.rst                  | 2 +-
>  Documentation/filesystems/caching/backend-api.rst | 2 +-
>  Documentation/locking/seqlock.rst                 | 2 +-
>  Documentation/sphinx/cdomain.py                   | 2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> index 8419019b6a88..6726f439958c 100644
> --- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
> +++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> @@ -200,7 +200,7 @@ prb
> 
>  A pointer to the printk ringbuffer (struct printk_ringbuffer). This
>  may be pointing to the static boot ringbuffer or the dynamically
> -allocated ringbuffer, depending on when the the core dump occurred.
> +allocated ringbuffer, depending on when the core dump occurred.
>  Used by user-space tools to read the active kernel log buffer.
> 
>  printk_rb_static
> diff --git a/Documentation/bpf/map_cgroup_storage.rst b/Documentation/bpf/map_cgroup_storage.rst
> index cab9543017bf..8e5fe532c07e 100644
> --- a/Documentation/bpf/map_cgroup_storage.rst
> +++ b/Documentation/bpf/map_cgroup_storage.rst
> @@ -31,7 +31,7 @@ The map uses key of type of either ``__u64 cgroup_inode_id`` or
>      };
> 
>  ``cgroup_inode_id`` is the inode id of the cgroup directory.
> -``attach_type`` is the the program's attach type.
> +``attach_type`` is the program's attach type.
> 
>  Linux 5.9 added support for type ``__u64 cgroup_inode_id`` as the key type.
>  When this key type is used, then all attach types of the particular cgroup and
> @@ -155,7 +155,7 @@ However, the BPF program can still only associate with one map of each type
>  ``BPF_MAP_TYPE_CGROUP_STORAGE`` or more than one
>  ``BPF_MAP_TYPE_PERCPU_CGROUP_STORAGE``.
> 
> -In all versions, userspace may use the the attach parameters of cgroup and
> +In all versions, userspace may use the attach parameters of cgroup and
>  attach type pair in ``struct bpf_cgroup_storage_key`` as the key to the BPF map
>  APIs to read or update the storage for a given attachment. For Linux 5.9
>  attach type shared storages, only the first value in the struct, cgroup inode
> diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
> index c6f4ba2fb32d..f75778d37488 100644
> --- a/Documentation/core-api/cpu_hotplug.rst
> +++ b/Documentation/core-api/cpu_hotplug.rst
> @@ -560,7 +560,7 @@ available:
>    * cpuhp_state_remove_instance(state, node)
>    * cpuhp_state_remove_instance_nocalls(state, node)
> 
> -The arguments are the same as for the the cpuhp_state_add_instance*()
> +The arguments are the same as for the cpuhp_state_add_instance*()
>  variants above.
> 
>  The functions differ in the way how the installed callbacks are treated:
> diff --git a/Documentation/driver-api/isa.rst b/Documentation/driver-api/isa.rst
> index def4a7b690b5..3df1b1696524 100644
> --- a/Documentation/driver-api/isa.rst
> +++ b/Documentation/driver-api/isa.rst
> @@ -100,7 +100,7 @@ I believe platform_data is available for this, but if rather not, moving
>  the isa_driver pointer to the private struct isa_dev is ofcourse fine as
>  well.
> 
> -Then, if the the driver did not provide a .match, it matches. If it did,
> +Then, if the driver did not provide a .match, it matches. If it did,
>  the driver match() method is called to determine a match.
> 
>  If it did **not** match, dev->platform_data is reset to indicate this to
> diff --git a/Documentation/filesystems/caching/backend-api.rst b/Documentation/filesystems/caching/backend-api.rst
> index d7507becf674..3a199fc50828 100644
> --- a/Documentation/filesystems/caching/backend-api.rst
> +++ b/Documentation/filesystems/caching/backend-api.rst
> @@ -122,7 +122,7 @@ volumes, calling::
>  to tell fscache that a volume has been withdrawn.  This waits for all
>  outstanding accesses on the volume to complete before returning.
> 
> -When the the cache is completely withdrawn, fscache should be notified by
> +When the cache is completely withdrawn, fscache should be notified by
>  calling::
> 
>       void fscache_relinquish_cache(struct fscache_cache *cache);
> diff --git a/Documentation/locking/seqlock.rst b/Documentation/locking/seqlock.rst
> index 64405e5da63e..bfda1a5fecad 100644
> --- a/Documentation/locking/seqlock.rst
> +++ b/Documentation/locking/seqlock.rst
> @@ -39,7 +39,7 @@ as the writer can invalidate a pointer that the reader is following.
>  Sequence counters (``seqcount_t``)
>  ==================================
> 
> -This is the the raw counting mechanism, which does not protect against
> +This is the raw counting mechanism, which does not protect against
>  multiple writers.  Write side critical sections must thus be serialized
>  by an external lock.
> 
> diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
> index ca8ac9e59ded..a7d1866e72ff 100644
> --- a/Documentation/sphinx/cdomain.py
> +++ b/Documentation/sphinx/cdomain.py
> @@ -151,7 +151,7 @@ class CObject(Base_CObject):
>      def handle_func_like_macro(self, sig, signode):
>          u"""Handles signatures of function-like macros.
> 
> -        If the objtype is 'function' and the the signature ``sig`` is a
> +        If the objtype is 'function' and the signature ``sig`` is a
>          function-like macro, the name of the macro is returned. Otherwise
>          ``False`` is returned.  """
> 
> --
> 2.25.1
>
>
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
>






--

This is my life,but world of us~~
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

