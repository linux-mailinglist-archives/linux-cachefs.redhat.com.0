Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B34715D73
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 May 2023 13:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685446857;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TF5PuKhpZGMO8UpbTH+2uTVr2vfQFyoMcoE7xAK7oQA=;
	b=Icg/OM/OCEKaKDZY5RTE2UIChzyHvawGXiD7NUDYUCrvuQAlKKXiYjL7QoKxwuEy91CmcS
	T2xvsLMKPZl/07M8+TychbPL86Ut07R3fug5biZ4nZyClgpRFLUUM9zviI131Fyw2XRtTK
	B3Z4pBkYsyiunVHbHdgP3Ycyu1UIDUM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-XrqpTbtqO3OiRrcholn4QQ-1; Tue, 30 May 2023 07:40:54 -0400
X-MC-Unique: XrqpTbtqO3OiRrcholn4QQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0046585A5A8;
	Tue, 30 May 2023 11:40:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 089882166B25;
	Tue, 30 May 2023 11:40:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 38AAB19465A8;
	Tue, 30 May 2023 11:40:52 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 953F51946595 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 30 May 2023 11:40:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 50D0B20296C8; Tue, 30 May 2023 11:40:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 497DE20296C6
 for <linux-cachefs@redhat.com>; Tue, 30 May 2023 11:40:51 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2812A1C0150D
 for <linux-cachefs@redhat.com>; Tue, 30 May 2023 11:40:51 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-vhIbBxM_Ob6IUuZ4J2Glvw-1; Tue, 30 May 2023 07:40:49 -0400
X-MC-Unique: vhIbBxM_Ob6IUuZ4J2Glvw-1
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-3f60e536250so36081155e9.1
 for <linux-cachefs@redhat.com>; Tue, 30 May 2023 04:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685446848; x=1688038848;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JfxZd78x7Eg2He51Zgadvuo5PN2tYofIhsma78aQpeU=;
 b=YJ0hF7cwGsYrWMtjP/IYpqhHmwbYPw0+G9CDE8fGVluAm7KbpUI5zrZJweqNoegL4y
 /hKCOY5NHG0mVm98EtKwxjCgTaCG0jGY/dYPFJx0LnyWPkJbyA2QDQp3GN8kBKqAtKo+
 DW/2AHeyeludynEPW+Uq5ujt50+quF4fcWCGNOxRxRn1NRGQ+NFKTMBDZfqzyXipNV4P
 vN/Z/dV5qSCV/WAgdsqevuefzRMWssO3Ybw9LkSWioRWmAv01vuNMoRQwmUZ+gkvUzz/
 eKqVZLZ4qQgPeVg2ilNd4XMuNdPUp3E6HIpcplSCuDdC/rGKUbhnRbhsJn9+ZbHMCN9B
 /vpg==
X-Gm-Message-State: AC+VfDzg6gWJZskXlyH4Pwzqluama4b28YkkbpfkuR7YL45nUU+wBv8P
 Gi8rE4AjjZzCM0pG4r9PRXyiPibe5xjAiaIp3P4=
X-Google-Smtp-Source: ACHHUZ5ghkzZLjML0uVoOZ1E0cvJB3J3UujJZaeV1JfRnOSxBcHQgR4NyZBsvKTIyiCOT6I5kHOrZw==
X-Received: by 2002:a05:600c:2208:b0:3f6:d90:3db with SMTP id
 z8-20020a05600c220800b003f60d9003dbmr1540543wml.3.1685446848145; 
 Tue, 30 May 2023 04:40:48 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 e21-20020a05600c219500b003f604ca479esm20815959wme.3.2023.05.30.04.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 04:40:46 -0700 (PDT)
Date: Tue, 30 May 2023 14:40:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dhowells@redhat.com
Message-ID: <b5f96ca4-3923-4dcb-8c87-97f6ffb0aeae@kili.mountain>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Linux-cachefs] [bug report] fscache: Implement volume registration
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
Cc: linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linaro.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello David Howells,

The patch 62ab63352350: "fscache: Implement volume registration" from
Oct 20, 2021, leads to the following Smatch static checker warning:

	fs/fscache/volume.c:420 fscache_put_volume()
	warn: sleeping in atomic context

fs/fscache/volume.c
    409 void fscache_put_volume(struct fscache_volume *volume,
    410                         enum fscache_volume_trace where)
    411 {
    412         if (volume) {
    413                 unsigned int debug_id = volume->debug_id;
    414                 bool zero;
    415                 int ref;
    416 
    417                 zero = __refcount_dec_and_test(&volume->ref, &ref);
    418                 trace_fscache_volume(debug_id, ref - 1, where);
    419                 if (zero)
--> 420                         fscache_free_volume(volume);

fscache_free_volume() calls down_write() which sleeps.

    421         }
    422 }

The more difficult thing to explain is how this is called with preempt
disabled.  According to Smatch there are lots of callers which disable
preempt.  I have included the complete list at the end, all the
places marked as "disables preempt" apparently have a call tree from
there to fscache_put_volume().

But I have cleaned up one call tree here.

cachefiles_withdraw_objects() <- disables preempt
-> fscache_withdraw_cookie()
   -> fscache_drop_withdraw_cookie()
      -> fscache_cookie_drop_from_lru()
         -> fscache_put_cookie()
            -> fscache_put_volume()

regards,
dan carpenter

nfs_inode_set_delegation() <- disables preempt
alloc_nfs_open_dir_context() <- disables preempt
nfs_mark_dir_for_revalidate() <- disables preempt
nfs_drop_nlink() <- disables preempt
nfs_rename() <- disables preempt
nfs_zap_caches() <- disables preempt
nfs_set_inode_stale() <- disables preempt
nfs_setattr_update_inode() <- disables preempt
nfs_refresh_inode() <- disables preempt
nfs_post_op_update_inode() <- disables preempt
nfs_post_op_update_inode_force_wcc() <- disables preempt
nfs_writeback_update_inode() <- disables preempt
-> nfs_post_op_update_inode_force_wcc_locked()
   -> nfs_post_op_update_inode_locked()
      -> nfs_refresh_inode_locked()
         -> nfs_update_inode()
            -> nfs_set_inode_stale_locked()
               -> nfs_zap_caches_locked()
nfs_zap_mapping() <- disables preempt
nfs_invalidate_atime() <- disables preempt
nfs_setattr_update_inode() <- disables preempt <duplicate>
nfs_inode_attach_open_context() <- disables preempt
nfs_update_inode() <duplicate>
-> nfs_wcc_update_inode()
nfs_refresh_inode_locked() <duplicate>
-> nfs_check_inode_attributes()
nfs_post_op_update_inode_locked() <duplicate>
nfs_update_inode() <duplicate>
nfs4_inc_nlink() <- disables preempt
nfs4_do_create() <- disables preempt
-> nfs4_inc_nlink_locked()
_nfs4_proc_remove() <- disables preempt
-> nfs4_dec_nlink_locked()
nfs4_update_changeattr() <- disables preempt
_nfs4_proc_remove() <- disables preempt <duplicate>
nfs4_do_create() <- disables preempt <duplicate>
-> nfs4_update_changeattr_locked()
__nfs4_proc_set_acl() <- disables preempt
_nfs42_proc_fallocate() <- disables preempt
nfs42_copy_dest_done() <- disables preempt
nfs_sillyrename() <- disables preempt
nfs_set_pageerror() <- disables preempt
nfs_writeback_done() <- disables preempt
                  -> nfs_set_cache_invalid()
                     -> nfs_fscache_invalidate()
                        -> fscache_invalidate()
                           -> __fscache_invalidate() <- disables preempt
                              -> fscache_begin_cookie_access()
fscache_cookie_state_machine() <- disables preempt
                                 -> fscache_end_cookie_access()
cachefiles_withdraw_objects() <- disables preempt
-> fscache_withdraw_cookie()
   -> fscache_drop_withdraw_cookie()
      -> __fscache_withdraw_cookie()
__fscache_invalidate() <duplicate>
                                    -> fscache_queue_cookie()
                                       -> __fscache_queue_cookie()
fscache_drop_withdraw_cookie() <duplicate>
-> fscache_cookie_drop_from_lru()
                                          -> fscache_put_cookie()
                                             -> fscache_put_volume()


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

