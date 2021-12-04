Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F070468378
	for <lists+linux-cachefs@lfdr.de>; Sat,  4 Dec 2021 10:13:38 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-ew0f5Wn2NI6RqFUlrCMimg-1; Sat, 04 Dec 2021 04:13:34 -0500
X-MC-Unique: ew0f5Wn2NI6RqFUlrCMimg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F4958042F6;
	Sat,  4 Dec 2021 09:13:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBC4A5DF21;
	Sat,  4 Dec 2021 09:13:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 38F711809CB8;
	Sat,  4 Dec 2021 09:13:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B429J44018212 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Dec 2021 21:09:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1D4BA4047279; Sat,  4 Dec 2021 02:09:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 195044047272
	for <linux-cachefs@redhat.com>; Sat,  4 Dec 2021 02:09:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 009E3805B0A
	for <linux-cachefs@redhat.com>; Sat,  4 Dec 2021 02:09:19 +0000 (UTC)
Received: from mx.cjr.nz (mx.cjr.nz [51.158.111.142]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-333-yD_0WtUcO8SHm4qGDoXvzg-1; Fri, 03 Dec 2021 21:09:17 -0500
X-MC-Unique: yD_0WtUcO8SHm4qGDoXvzg-1
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	(Authenticated sender: pc)
	by mx.cjr.nz (Postfix) with ESMTPSA id 03B46808AC;
	Sat,  4 Dec 2021 02:00:51 +0000 (UTC)
Date: Fri, 03 Dec 2021 23:00:42 -0300
From: Paulo Alcantara <pc@cjr.nz>
To: Jeff Layton <jlayton@redhat.com>, Shyam Prasad N <nspmangalore@gmail.com>, 
	David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>,
	CIFS <linux-cifs@vger.kernel.org>, linux-cachefs@redhat.com
In-Reply-To: <88b88564292f84714c83bfe14cae75691e4387c5.camel@redhat.com>
References: <CANT5p=qXbQU4g4VX=W9mOQo1SjMxnFGfpkLOJWgCpicyDLvt-w@mail.gmail.com>
	<88b88564292f84714c83bfe14cae75691e4387c5.camel@redhat.com>
Message-ID: <5550E7F6-E870-4A21-88F5-4D08BE5990CF@cjr.nz>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1B429J44018212
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Sat, 04 Dec 2021 04:13:20 -0500
Subject: Re: [Linux-cachefs] [PATCH] cifs: wait for tcon resource_id before
	getting fscache super
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On December 3, 2021 1:21:15 PM GMT-03:00, Jeff Layton <jlayton@redhat.com> wrote:
>On Fri, 2021-12-03 at 14:52 +0530, Shyam Prasad N wrote:
>> The logic for initializing tcon->resource_id is done inside
>> cifs_root_iget. fscache super cookie relies on this for aux
>> data. So we need to push the fscache initialization to this
>> later point during mount.
>> 
>> Signed-off-by: Shyam Prasad N <sprasad@microsoft.com>
>> ---
>>  fs/cifs/connect.c | 6 ------
>>  fs/cifs/fscache.c | 2 +-
>>  fs/cifs/inode.c   | 7 +++++++
>>  3 files changed, 8 insertions(+), 7 deletions(-)
>> 
>> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
>> index 6b705026da1a3..eee994b0925ff 100644
>> --- a/fs/cifs/connect.c
>> +++ b/fs/cifs/connect.c
>> @@ -3046,12 +3046,6 @@ static int mount_get_conns(struct mount_ctx *mnt_ctx)
>>   cifs_dbg(VFS, "read only mount of RW share\n");
>>   /* no need to log a RW mount of a typical RW share */
>>   }
>> - /*
>> - * The cookie is initialized from volume info returned above.
>> - * Inside cifs_fscache_get_super_cookie it checks
>> - * that we do not get super cookie twice.
>> - */
>> - cifs_fscache_get_super_cookie(tcon);
>>   }
>> 
>>   /*
>> diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
>> index 7e409a38a2d7c..f4da693760c11 100644
>> --- a/fs/cifs/fscache.c
>> +++ b/fs/cifs/fscache.c
>> @@ -92,7 +92,7 @@ void cifs_fscache_get_super_cookie(struct cifs_tcon *tcon)
>>   * In the future, as we integrate with newer fscache features,
>>   * we may want to instead add a check if cookie has changed
>>   */
>> - if (tcon->fscache == NULL)
>> + if (tcon->fscache)
>>   return;
>> 
>
>Ouch! Does the above mean that fscache on cifs is just plain broken at
>the moment? If this is the routine that sets the tcon cookie, then it
>looks like it just never gets set?

Dont much know about fscache, but remember that multiple mounts can share a single tcon (if not using nosharesock).  So, if we find an existing tcon and we have a cookie for it already, the check makes sense.

>
>>   sharename = extract_sharename(tcon->treeName);
>> diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
>> index 82848412ad852..96d083db17372 100644
>> --- a/fs/cifs/inode.c
>> +++ b/fs/cifs/inode.c
>> @@ -1376,6 +1376,13 @@ struct inode *cifs_root_iget(struct super_block *sb)
>>   inode = ERR_PTR(rc);
>>   }
>> 
>> + /*
>> + * The cookie is initialized from volume info returned above.
>> + * Inside cifs_fscache_get_super_cookie it checks
>> + * that we do not get super cookie twice.
>> + */
>> + cifs_fscache_get_super_cookie(tcon);
>> +
>>  out:
>>   kfree(path);
>>   free_xid(xid);
>> 
>


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

