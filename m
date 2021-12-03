Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67696467D77
	for <lists+linux-cachefs@lfdr.de>; Fri,  3 Dec 2021 19:47:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-MD9hf_hkM6Cyqk8GRqW0iw-1; Fri, 03 Dec 2021 13:47:37 -0500
X-MC-Unique: MD9hf_hkM6Cyqk8GRqW0iw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1433B19253C6;
	Fri,  3 Dec 2021 18:47:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 748945C1D5;
	Fri,  3 Dec 2021 18:47:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A41DF4BB7B;
	Fri,  3 Dec 2021 18:47:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B3IffBh019264 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Dec 2021 13:41:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 26E93C15E73; Fri,  3 Dec 2021 18:41:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 215AAC15E6F
	for <linux-cachefs@redhat.com>; Fri,  3 Dec 2021 18:41:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0815B811E7A
	for <linux-cachefs@redhat.com>; Fri,  3 Dec 2021 18:41:41 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-34-A1FqJ2jxPT-sOzc8n2LXHA-1; Fri, 03 Dec 2021 13:41:35 -0500
X-MC-Unique: A1FqJ2jxPT-sOzc8n2LXHA-1
Received: by mail-lf1-f42.google.com with SMTP id z7so8570383lfi.11;
	Fri, 03 Dec 2021 10:41:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SF9LE+LPSRE2ucpW+f2mkpPTMAq2jUVPSiHZ5CXrd7w=;
	b=ITheYkMMPxBu/5rI64xj4QI36m6ThwWjEsWpaVyuT65gGlip/aX9BWrAwaK/uSE/ap
	Onl+d7fLjiCepGXw4ZV6lw1TpcYNTeolKPXKb6z+bj4o4AnW/oEQdmmk1pBo/JgxjHv2
	CEt4MK8DlAgORKJLNCk6dtI09/rvF/ftbbeH5MJM76WUw/QGV74kiyKKZz8+J1SKcBe4
	R32P89lJAkqw+GXfXs9MHBsK9lwxr2NaIG48OqFiixODLo11Gn0ouAU1KNb3oy3yLuKV
	AVQxOBGWqNZSIHskuPHITWbalA6Eg/mTR/yevPv1Od9Z2IWC1+wT+tx1n8wfoPDTnFbN
	a0jg==
X-Gm-Message-State: AOAM533LoKKbt0YIu5n/QKUyaUCZjTwjkH+ONeHuIj7WYoLxgPQcyJQP
	oHJ0DGHzBCPHUyiaTXu1peC+oeNrJUNlRzfrxRrzpHJqwvU=
X-Google-Smtp-Source: ABdhPJycHyi1xiZb48OakAKdbq4M93ibzcXH7OBqc4UC/RHiy6Z7Nu+VaYuQRrF8Z0l2H3ABh4lqKF2Y+2PCvjLZnJE=
X-Received: by 2002:ac2:5ddb:: with SMTP id x27mr18880008lfq.595.1638556892934;
	Fri, 03 Dec 2021 10:41:32 -0800 (PST)
MIME-Version: 1.0
References: <CANT5p=pqb7MmFe+kQU67Eytm98tZB1ztr0d5Rwq44oxAq81+Dw@mail.gmail.com>
In-Reply-To: <CANT5p=pqb7MmFe+kQU67Eytm98tZB1ztr0d5Rwq44oxAq81+Dw@mail.gmail.com>
From: Steve French <smfrench@gmail.com>
Date: Fri, 3 Dec 2021 12:41:21 -0600
Message-ID: <CAH2r5mvKQMJdApwfhYkVNwgow4M1ZZ7e_JsnVqrYStD0LNXX9w@mail.gmail.com>
To: Shyam Prasad N <nspmangalore@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, Paulo Alcantara <pc@cjr.nz>,
	linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH] cifs: add server conn_id to fscache
	client cookie
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="0000000000008c60f705d24241c8"

--0000000000008c60f705d24241c8
Content-Type: text/plain; charset="UTF-8"

Added fix for problem (missing ifdef) pointed out by kernel test robot
+#ifdef CONFIG_CIFS_FSCACHE
+       else
+               tcp_ses->fscache = tcp_ses->primary_server->fscache;
+#endif /* CONFIG_CIFS_FSCACHE */



See attached

On Fri, Dec 3, 2021 at 3:28 AM Shyam Prasad N <nspmangalore@gmail.com> wrote:
>
> The fscache client cookie uses the server address
> (and port) as the cookie key. This is a problem when
> nosharesock is used. Two different connections will
> use duplicate cookies. Avoid this by adding
> server->conn_id to the key, so that it's guaranteed
> that cookie will not be duplicated.
>
> Also, for secondary channels of a session, copy the
> fscache pointer from the primary channel. The primary
> channel is guaranteed not to go away as long as secondary
> channels are in use.
>
> Signed-off-by: Shyam Prasad N <sprasad@microsoft.com>
> ---
>  fs/cifs/connect.c |  2 ++
>  fs/cifs/fscache.c | 10 ++++++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index eee994b0925f..d8822e835cc4 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -1562,6 +1562,8 @@ cifs_get_tcp_session(struct smb3_fs_context *ctx,
>   /* fscache server cookies are based on primary channel only */
>   if (!CIFS_SERVER_IS_CHAN(tcp_ses))
>   cifs_fscache_get_client_cookie(tcp_ses);
> + else
> + tcp_ses->fscache = tcp_ses->primary_server->fscache;
>
>   /* queue echo request delayed work */
>   queue_delayed_work(cifsiod_wq, &tcp_ses->echo, tcp_ses->echo_interval);
> diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
> index f4da693760c1..1db3437f3b7d 100644
> --- a/fs/cifs/fscache.c
> +++ b/fs/cifs/fscache.c
> @@ -24,6 +24,7 @@ struct cifs_server_key {
>   struct in_addr ipv4_addr;
>   struct in6_addr ipv6_addr;
>   };
> + __u64 conn_id;
>  } __packed;
>
>  /*
> @@ -37,6 +38,14 @@ void cifs_fscache_get_client_cookie(struct
> TCP_Server_Info *server)
>   struct cifs_server_key key;
>   uint16_t key_len = sizeof(key.hdr);
>
> + /*
> + * Check if cookie was already initialized so don't reinitialize it.
> + * In the future, as we integrate with newer fscache features,
> + * we may want to instead add a check if cookie has changed
> + */
> + if (server->fscache)
> + return;
> +
>   memset(&key, 0, sizeof(key));
>
>   /*
> @@ -62,6 +71,7 @@ void cifs_fscache_get_client_cookie(struct
> TCP_Server_Info *server)
>   server->fscache = NULL;
>   return;
>   }
> + key.conn_id = server->conn_id;
>
>   server->fscache =
>   fscache_acquire_cookie(cifs_fscache_netfs.primary_index,



-- 
Thanks,

Steve

--0000000000008c60f705d24241c8
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-add-server-conn_id-to-fscache-client-cookie.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-add-server-conn_id-to-fscache-client-cookie.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kwqqfb5z0>
X-Attachment-Id: f_kwqqfb5z0

RnJvbSAyYWRjODIwMDZiY2IwNjc1MjNiZWRkMzhlOTM3MTFjODBmZDI3NGMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaHlhbSBQcmFzYWQgTiA8c3ByYXNhZEBtaWNyb3NvZnQuY29t
PgpEYXRlOiBUaHUsIDIgRGVjIDIwMjEgMDc6MzA6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
aWZzOiBhZGQgc2VydmVyIGNvbm5faWQgdG8gZnNjYWNoZSBjbGllbnQgY29va2llCgpUaGUgZnNj
YWNoZSBjbGllbnQgY29va2llIHVzZXMgdGhlIHNlcnZlciBhZGRyZXNzCihhbmQgcG9ydCkgYXMg
dGhlIGNvb2tpZSBrZXkuIFRoaXMgaXMgYSBwcm9ibGVtIHdoZW4Kbm9zaGFyZXNvY2sgaXMgdXNl
ZC4gVHdvIGRpZmZlcmVudCBjb25uZWN0aW9ucyB3aWxsCnVzZSBkdXBsaWNhdGUgY29va2llcy4g
QXZvaWQgdGhpcyBieSBhZGRpbmcKc2VydmVyLT5jb25uX2lkIHRvIHRoZSBrZXksIHNvIHRoYXQg
aXQncyBndWFyYW50ZWVkCnRoYXQgY29va2llIHdpbGwgbm90IGJlIGR1cGxpY2F0ZWQuCgpBbHNv
LCBmb3Igc2Vjb25kYXJ5IGNoYW5uZWxzIG9mIGEgc2Vzc2lvbiwgY29weSB0aGUKZnNjYWNoZSBw
b2ludGVyIGZyb20gdGhlIHByaW1hcnkgY2hhbm5lbC4gVGhlIHByaW1hcnkKY2hhbm5lbCBpcyBn
dWFyYW50ZWVkIG5vdCB0byBnbyBhd2F5IGFzIGxvbmcgYXMgc2Vjb25kYXJ5CmNoYW5uZWxzIGFy
ZSBpbiB1c2UuICBBbHNvIGFkZHJlc3NlcyBtaW5vciBwcm9ibGVtIGZvdW5kCmJ5IGtlcm5lbCB0
ZXN0IHJvYm90LgoKUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29t
PgpTaWduZWQtb2ZmLWJ5OiBTaHlhbSBQcmFzYWQgTiA8c3ByYXNhZEBtaWNyb3NvZnQuY29tPgpS
ZXZpZXdlZC1ieTogUGF1bG8gQWxjYW50YXJhIChTVVNFKSA8cGNAY2pyLm56PgpTaWduZWQtb2Zm
LWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvY2lmcy9j
b25uZWN0LmMgfCAgNCArKysrCiBmcy9jaWZzL2ZzY2FjaGUuYyB8IDEwICsrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvY29u
bmVjdC5jIGIvZnMvY2lmcy9jb25uZWN0LmMKaW5kZXggN2NjNDY5ZTQ2ODJhLi4xODQ0OGRiZDc2
MmEgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvY29ubmVjdC5jCisrKyBiL2ZzL2NpZnMvY29ubmVjdC5j
CkBAIC0xNTYyLDYgKzE1NjIsMTAgQEAgY2lmc19nZXRfdGNwX3Nlc3Npb24oc3RydWN0IHNtYjNf
ZnNfY29udGV4dCAqY3R4LAogCS8qIGZzY2FjaGUgc2VydmVyIGNvb2tpZXMgYXJlIGJhc2VkIG9u
IHByaW1hcnkgY2hhbm5lbCBvbmx5ICovCiAJaWYgKCFDSUZTX1NFUlZFUl9JU19DSEFOKHRjcF9z
ZXMpKQogCQljaWZzX2ZzY2FjaGVfZ2V0X2NsaWVudF9jb29raWUodGNwX3Nlcyk7CisjaWZkZWYg
Q09ORklHX0NJRlNfRlNDQUNIRQorCWVsc2UKKwkJdGNwX3Nlcy0+ZnNjYWNoZSA9IHRjcF9zZXMt
PnByaW1hcnlfc2VydmVyLT5mc2NhY2hlOworI2VuZGlmIC8qIENPTkZJR19DSUZTX0ZTQ0FDSEUg
Ki8KIAogCS8qIHF1ZXVlIGVjaG8gcmVxdWVzdCBkZWxheWVkIHdvcmsgKi8KIAlxdWV1ZV9kZWxh
eWVkX3dvcmsoY2lmc2lvZF93cSwgJnRjcF9zZXMtPmVjaG8sIHRjcF9zZXMtPmVjaG9faW50ZXJ2
YWwpOwpkaWZmIC0tZ2l0IGEvZnMvY2lmcy9mc2NhY2hlLmMgYi9mcy9jaWZzL2ZzY2FjaGUuYwpp
bmRleCBmNGRhNjkzNzYwYzEuLjFkYjM0MzdmM2I3ZCAxMDA2NDQKLS0tIGEvZnMvY2lmcy9mc2Nh
Y2hlLmMKKysrIGIvZnMvY2lmcy9mc2NhY2hlLmMKQEAgLTI0LDYgKzI0LDcgQEAgc3RydWN0IGNp
ZnNfc2VydmVyX2tleSB7CiAJCXN0cnVjdCBpbl9hZGRyCWlwdjRfYWRkcjsKIAkJc3RydWN0IGlu
Nl9hZGRyCWlwdjZfYWRkcjsKIAl9OworCV9fdTY0IGNvbm5faWQ7CiB9IF9fcGFja2VkOwogCiAv
KgpAQCAtMzcsNiArMzgsMTQgQEAgdm9pZCBjaWZzX2ZzY2FjaGVfZ2V0X2NsaWVudF9jb29raWUo
c3RydWN0IFRDUF9TZXJ2ZXJfSW5mbyAqc2VydmVyKQogCXN0cnVjdCBjaWZzX3NlcnZlcl9rZXkg
a2V5OwogCXVpbnQxNl90IGtleV9sZW4gPSBzaXplb2Yoa2V5Lmhkcik7CiAKKwkvKgorCSAqIENo
ZWNrIGlmIGNvb2tpZSB3YXMgYWxyZWFkeSBpbml0aWFsaXplZCBzbyBkb24ndCByZWluaXRpYWxp
emUgaXQuCisJICogSW4gdGhlIGZ1dHVyZSwgYXMgd2UgaW50ZWdyYXRlIHdpdGggbmV3ZXIgZnNj
YWNoZSBmZWF0dXJlcywKKwkgKiB3ZSBtYXkgd2FudCB0byBpbnN0ZWFkIGFkZCBhIGNoZWNrIGlm
IGNvb2tpZSBoYXMgY2hhbmdlZAorCSAqLworCWlmIChzZXJ2ZXItPmZzY2FjaGUpCisJCXJldHVy
bjsKKwogCW1lbXNldCgma2V5LCAwLCBzaXplb2Yoa2V5KSk7CiAKIAkvKgpAQCAtNjIsNiArNzEs
NyBAQCB2b2lkIGNpZnNfZnNjYWNoZV9nZXRfY2xpZW50X2Nvb2tpZShzdHJ1Y3QgVENQX1NlcnZl
cl9JbmZvICpzZXJ2ZXIpCiAJCXNlcnZlci0+ZnNjYWNoZSA9IE5VTEw7CiAJCXJldHVybjsKIAl9
CisJa2V5LmNvbm5faWQgPSBzZXJ2ZXItPmNvbm5faWQ7CiAKIAlzZXJ2ZXItPmZzY2FjaGUgPQog
CQlmc2NhY2hlX2FjcXVpcmVfY29va2llKGNpZnNfZnNjYWNoZV9uZXRmcy5wcmltYXJ5X2luZGV4
LAotLSAKMi4zMi4wCgo=
--0000000000008c60f705d24241c8
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs
--0000000000008c60f705d24241c8--

